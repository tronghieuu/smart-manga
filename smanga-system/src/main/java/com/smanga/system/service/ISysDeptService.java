package com.smanga.system.service;

import java.util.List;

import com.smanga.common.core.domain.Ztree;
import com.smanga.common.core.domain.entity.SysDept;
import com.smanga.common.core.domain.entity.SysRole;

/**
 * Department management service layer
 *
 * @author Trong Hieu
 */
public interface ISysDeptService
{
    /**
     * Query department management data
     *
     * @param dept department information
     * @return department information collection
     */
    public List<SysDept> selectDeptList(SysDept dept);

    /**
     * Query department management tree
     *
     * @param dept department information
     * @return All department information
     */
    public List<Ztree> selectDeptTree(SysDept dept);

    /**
     * Query department management tree (excluding subordinates)
     *
     * @param dept department information
     * @return All department information
     */
    public List<Ztree> selectDeptTreeExcludeChild(SysDept dept);

    /**
     * Query menu based on role ID
     *
     * @param role role object
     * @return menu list
     */
    public List<Ztree> roleDeptTreeData(SysRole role);

    /**
     * Query the number of department
     *
     * @param parentId parent department ID
     * @return result
     */
    public int selectDeptCount(Long parentId);

    /**
     * Query whether there are users in the department
     *
     * @param deptId department ID
     * @return result true exists false does not exist
     */
    public boolean checkDeptExistUser(Long deptId);

    /**
     * Delete department management information
     *
     * @param deptId department ID
     * @return result
     */
    public int deleteDeptById(Long deptId);

    /**
     * Added save department information
     *
     * @param dept department information
     * @return result
     */
    public int insertDept(SysDept dept);

    /**
     * Modify and save department information
     *
     * @param dept department information
     * @return result
     */
    public int updateDept(SysDept dept);

    /**
     * Query information based on department ID
     *
     * @param deptId department ID
     * @return department information
     */
    public SysDept selectDeptById(Long deptId);

    /**
     * Query all sub-departments based on ID (normal state)
     *
     * @param deptId department ID
     * @return Number of sub-departments
     */
    public int selectNormalChildrenDeptById(Long deptId);

    /**
     * Check whether the department name is unique
     *
     * @param dept department information
     * @return result
     */
    public String checkDeptNameUnique(SysDept dept);
}
