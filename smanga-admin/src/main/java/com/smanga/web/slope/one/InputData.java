package com.smanga.web.slope.one;

import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class InputData {

	protected static List<Item> items = Arrays.asList(new Item("Candy"), new Item("Drink"), new Item("Soda"),
			new Item("Popcorn"), new Item("Snacks"));

	public static Map<User, HashMap<Item, Double>> initializeData(int numberOfUsers) {
		Map<User, HashMap<Item, Double>> data = new HashMap<>();
		HashMap<Item, Double> newUser;
		Set<Item> newRecommendationSet;
		DecimalFormat df = new DecimalFormat("####0");
		for (int i = 0; i < numberOfUsers; i++) {
			newUser = new HashMap<Item, Double>();
			newRecommendationSet = new HashSet<>();
			for (int j = 0; j < 3; j++) {
				newRecommendationSet.add(items.get((int) (Math.random() * 5)));
			}
			for (Item item : newRecommendationSet) {
				newUser.put(item, Double.valueOf(df.format(Math.random() * 5)));
			}
			data.put(new User("User " + i), newUser);
		}
		return data;
	}

	public static List<Item> getItems() {
		return items;
	}

	public static void setItems(List<Item> items) {
		InputData.items = items;
	}

}
