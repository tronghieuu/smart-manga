package com.smanga.system.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smanga.common.annotation.DataScope;
import com.smanga.common.constant.UserConstants;
import com.smanga.common.core.domain.Ztree;
import com.smanga.common.core.domain.entity.SysDept;
import com.smanga.common.core.domain.entity.SysRole;
import com.smanga.common.exception.BusinessException;
import com.smanga.common.utils.StringUtils;
import com.smanga.system.mapper.SysDeptMapper;
import com.smanga.system.service.ISysDeptService;

/**
 * Department management service realization
 * 
 * @author Trong Hieu
 */
@Service
public class SysDeptServiceImpl implements ISysDeptService {
	@Autowired
	private SysDeptMapper deptMapper;

	/**
	 * Query department management data
	 * 
	 * @param dept Department Information
	 * @return Departmental Information Collection
	 */
	@Override
	@DataScope(deptAlias = "d")
	public List<SysDept> selectDeptList(SysDept dept) {
		return deptMapper.selectDeptList(dept);
	}

	/**
	 * Query department management tree
	 * 
	 * @param dept Department Information
	 * @return All department information
	 */
	@Override
	@DataScope(deptAlias = "d")
	public List<Ztree> selectDeptTree(SysDept dept) {
		List<SysDept> deptList = deptMapper.selectDeptList(dept);
		List<Ztree> ztrees = initZtree(deptList);
		return ztrees;
	}

	/**
	 * Query department management tree (excluding subordinates)
	 * 
	 * @param deptId Department ID
	 * @return All department information
	 */
	@Override
	@DataScope(deptAlias = "d")
	public List<Ztree> selectDeptTreeExcludeChild(SysDept dept) {
		Long deptId = dept.getDeptId();
		List<SysDept> deptList = deptMapper.selectDeptList(dept);
		Iterator<SysDept> it = deptList.iterator();
		while (it.hasNext()) {
			SysDept d = (SysDept) it.next();
			if (d.getDeptId().intValue() == deptId
					|| ArrayUtils.contains(StringUtils.split(d.getAncestors(), ","), deptId + "")) {
				it.remove();
			}
		}
		List<Ztree> ztrees = initZtree(deptList);
		return ztrees;
	}

	/**
	 * Query department based on role ID (data authority)
	 *
	 * @param role Role object
	 * @return Department list (data authority)
	 */
	@Override
	public List<Ztree> roleDeptTreeData(SysRole role) {
		Long roleId = role.getRoleId();
		List<Ztree> ztrees = new ArrayList<Ztree>();
		List<SysDept> deptList = selectDeptList(new SysDept());
		if (StringUtils.isNotNull(roleId)) {
			List<String> roleDeptList = deptMapper.selectRoleDeptTree(roleId);
			ztrees = initZtree(deptList, roleDeptList);
		} else {
			ztrees = initZtree(deptList);
		}
		return ztrees;
	}

	/**
	 * Object to department tree
	 *
	 * @param deptList Department list
	 * @return Tree structure list
	 */
	public List<Ztree> initZtree(List<SysDept> deptList) {
		return initZtree(deptList, null);
	}

	/**
	 * Object to department tree
	 *
	 * @param deptList     Department list
	 * @param roleDeptList Role already exists in the menu list
	 * @return Tree structure list
	 */
	public List<Ztree> initZtree(List<SysDept> deptList, List<String> roleDeptList) {

		List<Ztree> ztrees = new ArrayList<Ztree>();
		boolean isCheck = StringUtils.isNotNull(roleDeptList);
		for (SysDept dept : deptList) {
			if (UserConstants.DEPT_NORMAL.equals(dept.getStatus())) {
				Ztree ztree = new Ztree();
				ztree.setId(dept.getDeptId());
				ztree.setpId(dept.getParentId());
				ztree.setName(dept.getDeptName());
				ztree.setTitle(dept.getDeptName());
				if (isCheck) {
					ztree.setChecked(roleDeptList.contains(dept.getDeptId() + dept.getDeptName()));
				}
				ztrees.add(ztree);
			}
		}
		return ztrees;
	}

	/**
	 * Query the number of people in the department
	 * 
	 * @param parentId Department ID
	 * @return result
	 */
	@Override
	public int selectDeptCount(Long parentId) {
		SysDept dept = new SysDept();
		dept.setParentId(parentId);
		return deptMapper.selectDeptCount(dept);
	}

	/**
	 * Query whether there are users in t
	 * 
	 * @param deptId Department ID
	 * @return result true exists false does not exist
	 */
	@Override
	public boolean checkDeptExistUser(Long deptId) {
		int result = deptMapper.checkDeptExistUser(deptId);
		return result > 0 ? true : false;
	}

	/**
	 * Delete department managemen
	 * 
	 * @param deptId Department ID
	 * @return result
	 */
	@Override
	public int deleteDeptById(Long deptId) {
		return deptMapper.deleteDeptById(deptId);
	}

	/**
	 * Add and save department information
	 * 
	 * @param dept Department Information
	 * @return result
	 */
	@Override
	public int insertDept(SysDept dept) {
		SysDept info = deptMapper.selectDeptById(dept.getParentId());
		// If the parent node is not in the "normal" state, no new child nodes are allowed
		if (!UserConstants.DEPT_NORMAL.equals(info.getStatus())) {
			throw new BusinessException("Department is disabled, adding is not allowed");
		}
		dept.setAncestors(info.getAncestors() + "," + dept.getParentId());
		return deptMapper.insertDept(dept);
	}

	/**
	 * Modify and save department information
	 * 
	 * @param dept Department Information
	 * @return result
	 */
	@Override
	@Transactional
	public int updateDept(SysDept dept) {
		SysDept newParentDept = deptMapper.selectDeptById(dept.getParentId());
		SysDept oldDept = selectDeptById(dept.getDeptId());
		if (StringUtils.isNotNull(newParentDept) && StringUtils.isNotNull(oldDept)) {
			String newAncestors = newParentDept.getAncestors() + "," + newParentDept.getDeptId();
			String oldAncestors = oldDept.getAncestors();
			dept.setAncestors(newAncestors);
			updateDeptChildren(dept.getDeptId(), newAncestors, oldAncestors);
		}
		int result = deptMapper.updateDept(dept);
		if (UserConstants.DEPT_NORMAL.equals(dept.getStatus())) {
			// If the department is enabled, then all superior departments of the department are enabled
			updateParentDeptStatus(dept);
		}
		return result;
	}

	/**
	 * Modify the status of the department's parent department
	 * 
	 * @param dept Current department
	 */
	private void updateParentDeptStatus(SysDept dept) {
		String updateBy = dept.getUpdateBy();
		dept = deptMapper.selectDeptById(dept.getDeptId());
		dept.setUpdateBy(updateBy);
		deptMapper.updateDeptStatus(dept);
	}

	/**
	 * Modify child element relationship
	 * 
	 * @param deptId       Department ID being modified
	 * @param newAncestors New parent ID collection
	 * @param oldAncestors Old parent ID collection
	 */
	public void updateDeptChildren(Long deptId, String newAncestors, String oldAncestors) {
		List<SysDept> children = deptMapper.selectChildrenDeptById(deptId);
		for (SysDept child : children) {
			child.setAncestors(child.getAncestors().replace(oldAncestors, newAncestors));
		}
		if (children.size() > 0) {
			deptMapper.updateDeptChildren(children);
		}
	}

	/**
	 * Query information based on department ID
	 * 
	 * @param deptId Department ID
	 * @return Department Information
	 */
	@Override
	public SysDept selectDeptById(Long deptId) {
		return deptMapper.selectDeptById(deptId);
	}

	/**
	 * Query all sub-departments based on ID (normal state)
	 * 
	 * @param deptId Department ID
	 * @return Number of sub-departments
	 */
	@Override
	public int selectNormalChildrenDeptById(Long deptId) {
		return deptMapper.selectNormalChildrenDeptById(deptId);
	}

	/**
	 * Verify that the department name is unique
	 * 
	 * @param dept Department Information
	 * @return result
	 */
	@Override
	public String checkDeptNameUnique(SysDept dept) {
		Long deptId = StringUtils.isNull(dept.getDeptId()) ? -1L : dept.getDeptId();
		SysDept info = deptMapper.checkDeptNameUnique(dept.getDeptName(), dept.getParentId());
		if (StringUtils.isNotNull(info) && info.getDeptId().longValue() != deptId.longValue()) {
			return UserConstants.DEPT_NAME_NOT_UNIQUE;
		}
		return UserConstants.DEPT_NAME_UNIQUE;
	}
}
