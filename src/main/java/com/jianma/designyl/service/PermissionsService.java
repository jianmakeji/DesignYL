package com.jianma.designyl.service;

import com.jianma.designyl.model.Permission;

public interface PermissionsService {

	public int createPermission(Permission permission);

	public int deletePermission(Long permissionId);
}
