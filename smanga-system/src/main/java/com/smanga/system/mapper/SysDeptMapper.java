package com.smanga.system.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.smanga.common.core.domain.entity.SysDept;

/**
 * Department Management Data Layer
 * 
 * @author Trong Hieu
 */
public interface SysDeptMapper
{
    /**
     * Query the number of people in the department
     * 
     * @param dept Department Information
     * @return result
     */
    public int selectDeptCount(SysDept dept);

    /**
     * Query whether there are users in the department
     * 
     * @param deptId Department ID
     * @return result
     */
    public int checkDeptExistUser(Long deptId);

    /**
     * Query department management data
     * 
     * @param dept Department Information
     * @return Departmental Information Collection
     */
    public List<SysDept> selectDeptList(SysDept dept);

    /**
     * Delete department management information
     * 
     * @param deptId Department ID
     * @return result
     */
    public int deleteDeptById(Long deptId);

    /**
     * Add department information
     * 
     * @param dept Department Information
     * @return result
     */
    public int insertDept(SysDept dept);

    /**
     * Modify department information
     * 
     * @param dept Department Information
     * @return result
     */
    public int updateDept(SysDept dept);

    /**
     * Modify child element relationship
     * 
     * @param depts Child element
     * @return result
     */
    public int updateDeptChildren(@Param("depts") List<SysDept> depts);

    /**
     * Query information based on department ID
     * 
     * @param deptId Department ID
     * @return Department Information
     */
    public SysDept selectDeptById(Long deptId);

    /**
     * Verify that the department name is unique
     * 
     * @param deptName Department name
     * @param parentId Parent department ID
     * @return result
     */
    public SysDept checkDeptNameUnique(@Param("deptName") String deptName, @Param("parentId") Long parentId);

    /**
     * Query department based on role ID
     *
     * @param roleId Role ID
     * @return Department list
     */
    public List<String> selectRoleDeptTree(Long roleId);

    /**
     * Modify the status of the parent department of the department
     * 
     * @param dept department
     */
    public void updateDeptStatus(SysDept dept);

    /**
     * Query all sub-departments based on ID
     * 
     * @param deptId Department ID
     * @return Department list
     */
    public List<SysDept> selectChildrenDeptById(Long deptId);

    /**
     * Query all sub-departments based on ID (normal state)
     * 
     * @param deptId Department ID
     * @return Number of sub-departments
     */
    public int selectNormalChildrenDeptById(Long deptId);
}
