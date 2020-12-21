package com.smanga.web.task;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.smanga.business.domain.BusinessUser;
import com.smanga.business.domain.Manga;
import com.smanga.business.domain.RecommendManga;
import com.smanga.business.domain.UserManga;
import com.smanga.business.service.IMangaService;
import com.smanga.business.service.IRecommendMangaService;
import com.smanga.business.service.IUserMangaService;

/**
 * Timed task scheduling test
 * 
 * @author Trong Hieu
 */
@Component("recommendationTask")
public class recommendationTask {

	@Autowired
	private IMangaService mangaService;

	@Autowired
	private IUserMangaService userMangaService;

	@Autowired
	private IRecommendMangaService recommendMangaService;

	private static Map<Manga, Map<Manga, Double>> diff = new HashMap<>();
	private static Map<Manga, Map<Manga, Integer>> freq = new HashMap<>();
	private static Map<BusinessUser, HashMap<Manga, Double>> inputData;
	private static Map<BusinessUser, HashMap<Manga, Double>> outputData = new HashMap<>();
	private static List<Manga> mangas;

	public void predictRatingMangaForUser() {
		System.out.println("================================Begin predict user rating");
		inputData = new HashMap<BusinessUser, HashMap<Manga, Double>>();
		diff = new HashMap<>();
		freq = new HashMap<>();
		outputData = new HashMap<>();
		List<Manga> tempMangas = mangaService.selectMangaList(new Manga());
		mangas = new ArrayList<Manga>();
		for (Manga manga : tempMangas) {
			Manga tempManga = new Manga();
			tempManga.setId(manga.getId());
			tempManga.setMangaName(manga.getMangaName());
			mangas.add(tempManga);
		}
		UserManga usermangaParam = new UserManga();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("notNullRating", true);
		usermangaParam.setParams(params);
		List<UserManga> userMangas = userMangaService.selectUserMangaList(usermangaParam);
		List<UserManga> userMangasSeperated = new ArrayList<UserManga>();
		if (CollectionUtils.isNotEmpty(userMangas)) {
			UserManga tempUserManga = userMangas.get(0);
			for (UserManga userManga : userMangas) {
				if (!userManga.getUserId().equals(tempUserManga.getUserId())) {
					BusinessUser user = new BusinessUser();
					user.setUserName(tempUserManga.getUserName());
					user.setUserId(tempUserManga.getUserId());
					inputData.put(user, mangaRating(userMangasSeperated));
					userMangasSeperated = new ArrayList<UserManga>();
					tempUserManga = userManga;
				}
				userMangasSeperated.add(userManga);
			}
			BusinessUser user = new BusinessUser();
			user.setUserName(tempUserManga.getUserName());
			user.setUserId(tempUserManga.getUserId());
			inputData.put(user, mangaRating(userMangasSeperated));
		}
		System.out.println("Slope One - Before the Prediction\n");
		buildDifferencesMatrix(inputData);
		System.out.println("\nSlope One - With Predictions\n");
		predict(inputData);
	}

	/**
	 * Based on the available data, calculate the relationships between the items
	 * and number of occurences
	 * 
	 * @param data existing user data and their items' ratings
	 */
	private void buildDifferencesMatrix(Map<BusinessUser, HashMap<Manga, Double>> data) {
		for (HashMap<Manga, Double> user : data.values()) {
			for (Entry<Manga, Double> e : user.entrySet()) {
				if (!diff.containsKey(e.getKey())) {
					diff.put(e.getKey(), new HashMap<Manga, Double>());
					freq.put(e.getKey(), new HashMap<Manga, Integer>());
				}
				for (Entry<Manga, Double> e2 : user.entrySet()) {
					int oldCount = 0;
					if (freq.get(e.getKey()).containsKey(e2.getKey())) {
						oldCount = freq.get(e.getKey()).get(e2.getKey()).intValue();
					}
					double oldDiff = 0.0;
					if (diff.get(e.getKey()).containsKey(e2.getKey())) {
						oldDiff = diff.get(e.getKey()).get(e2.getKey()).doubleValue();
					}
					double observedDiff = e.getValue() - e2.getValue();
					freq.get(e.getKey()).put(e2.getKey(), oldCount + 1);
					diff.get(e.getKey()).put(e2.getKey(), oldDiff + observedDiff);
				}
			}
		}
		for (Manga j : diff.keySet()) {
			for (Manga i : diff.get(j).keySet()) {
				double oldValue = diff.get(j).get(i).doubleValue();
				int count = freq.get(j).get(i).intValue();
				diff.get(j).put(i, oldValue / count);
			}
		}
		printData(data);
	}

	/**
	 * Based on existing data predict all missing ratings. If prediction is not
	 * possible, the value will be equal to -1
	 * 
	 * @param data existing user data and their items' ratings
	 */
	private void predict(Map<BusinessUser, HashMap<Manga, Double>> data) {
		HashMap<Manga, Double> uPred = new HashMap<Manga, Double>();
		HashMap<Manga, Integer> uFreq = new HashMap<Manga, Integer>();
		for (Manga j : diff.keySet()) {
			uFreq.put(j, 0);
			uPred.put(j, 0.0);
		}
		for (Entry<BusinessUser, HashMap<Manga, Double>> e : data.entrySet()) {
			for (Manga j : e.getValue().keySet()) {
				for (Manga k : diff.keySet()) {
					try {
						double predictedValue = diff.get(k).get(j).doubleValue() + e.getValue().get(j).doubleValue();
						double finalValue = predictedValue * freq.get(k).get(j).intValue();
						uPred.put(k, uPred.get(k) + finalValue);
						uFreq.put(k, uFreq.get(k) + freq.get(k).get(j).intValue());
					} catch (NullPointerException e1) {
					}
				}
			}
			HashMap<Manga, Double> clean = new HashMap<Manga, Double>();
			for (Manga j : uPred.keySet()) {
				if (uFreq.get(j) > 0) {
					clean.put(j, uPred.get(j).doubleValue() / uFreq.get(j).intValue());
				}
			}
			for (Manga j : mangas) {
				if (e.getValue().containsKey(j)) {
					clean.put(j, e.getValue().get(j));
				} else if (!clean.containsKey(j)) {
					clean.put(j, -1.0);
				}
			}
			outputData.put(e.getKey(), clean);
		}
		printData(outputData);
		savePredictData(outputData);
	}

	private void printData(Map<BusinessUser, HashMap<Manga, Double>> data) {
		for (BusinessUser user : data.keySet()) {
			System.out.println(user.getUserName() + ":");
			print(data.get(user));
		}
	}

	private void print(HashMap<Manga, Double> hashMap) {
		NumberFormat formatter = new DecimalFormat("#0.000");
		for (Manga j : hashMap.keySet()) {
			System.out.println(" " + j.getMangaName() + " --> " + formatter.format(hashMap.get(j).doubleValue()));
		}
	}

	private HashMap<Manga, Double> mangaRating(List<UserManga> userMangas) {
		HashMap<Manga, Double> manga = new HashMap<Manga, Double>();
		for (UserManga userManga : userMangas) {
			Manga item = new Manga();
			item.setId(userManga.getMangaId());
			item.setMangaName(userManga.getMangaName());
			manga.put(item, userManga.getRating().doubleValue());
		}
		return manga;
	}

	private void savePredictData(Map<BusinessUser, HashMap<Manga, Double>> data) {
		recommendMangaService.deleteAll();
		for (BusinessUser user : data.keySet()) {
			HashMap<Manga, Double> inputDataHashMap = inputData.get(user);
			HashMap<Manga, Double> hashMap = data.get(user);
			for (Manga j : hashMap.keySet()) {
				if (!inputDataHashMap.containsKey(j) && hashMap.get(j).doubleValue() != -1) {
					RecommendManga recommendManga = new RecommendManga();
					recommendManga.setUserId(user.getUserId());
					recommendManga.setMangaId(j.getId());
					recommendManga.setRating(hashMap.get(j).floatValue());
					recommendManga.setIsRecommend(1);
					recommendMangaService.insertRecommendManga(recommendManga);
				}
			}
		}
	}
}
