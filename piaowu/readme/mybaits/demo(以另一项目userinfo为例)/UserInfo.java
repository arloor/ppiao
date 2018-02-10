package com.colorfulword.smallbluewhale.domain;

/**
 *
 * Created by jone.sun on 2017/8/9.
 */
public class UserInfo {
    private Integer userInfoId;
    private String userNumber;//工号/学号
    private String fullName; //姓名
    private String sex; //性别
    private String mobile; //手机号
    private String headPic; //头像
    private String email; //邮箱
    private String qq; //QQ
    private Integer schoolBuildingId; //所属楼栋
    private Integer schoolDormId; //所属宿舍
    private Integer schoolStudyId; //所属院系
    private String grade; //年级

    private SchoolBuilding schoolBuilding;//所属楼栋 显示用
    private SchoolDorm schoolDorm; //所属宿舍 显示用
    private SchoolStudyInfo schoolStudyInfo; //所属院系 显示用

    public Integer getUserInfoId() {
        return userInfoId;
    }

    public void setUserInfoId(Integer userInfoId) {
        this.userInfoId = userInfoId;
    }

    public String getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(String userNumber) {
        this.userNumber = userNumber;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public Integer getSchoolBuildingId() {
        return schoolBuildingId;
    }

    public void setSchoolBuildingId(Integer schoolBuildingId) {
        this.schoolBuildingId = schoolBuildingId;
    }

    public Integer getSchoolDormId() {
        return schoolDormId;
    }

    public void setSchoolDormId(Integer schoolDormId) {
        this.schoolDormId = schoolDormId;
    }

    public Integer getSchoolStudyId() {
        return schoolStudyId;
    }

    public void setSchoolStudyId(Integer schoolStudyId) {
        this.schoolStudyId = schoolStudyId;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public SchoolBuilding getSchoolBuilding() {
        return schoolBuilding;
    }

    public void setSchoolBuilding(SchoolBuilding schoolBuilding) {
        this.schoolBuilding = schoolBuilding;
    }

    public SchoolDorm getSchoolDorm() {
        return schoolDorm;
    }

    public void setSchoolDorm(SchoolDorm schoolDorm) {
        this.schoolDorm = schoolDorm;
    }

    public SchoolStudyInfo getSchoolStudyInfo() {
        return schoolStudyInfo;
    }

    public void setSchoolStudyInfo(SchoolStudyInfo schoolStudyInfo) {
        this.schoolStudyInfo = schoolStudyInfo;
    }
}
