package com.colorfulword.smallbluewhale.dao;

import com.colorfulword.smallbluewhale.domain.UserInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by jone.sun on 2017/8/9.
 */
@Mapper
public interface UserInfoDao {

    List<UserInfo> list();

    //新增或者更新时需要同步创建user
    int insert(UserInfo userInfo);

    int delete(Integer userInfoId);

    int update(UserInfo userInfo);

    UserInfo get(Integer userInfoId);

    List<UserInfo> getByUserNumber(String userNumber);

    List<UserInfo> getByFullName(String fullName);

    List<UserInfo> getBySchoolBuildingId(Integer schoolBuildingId);

    List<UserInfo> getBySchoolDormId(Integer schoolDormId);

    List<UserInfo> getBySchoolGrade(Integer schoolStudyId, String grade);

}
