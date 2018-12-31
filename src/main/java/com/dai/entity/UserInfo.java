package com.dai.entity;

/**
 * 用户信息
 * @author hero 2018/12/29
 */
public class UserInfo {

    /**
     * 用户账号
     */
    private String userAccount;
    /**
     * 用户密码
     */
    private String userPass;
    /**
     * 用户角色 (0:管理员  1:用户 )
     */
    private short role;
    /**
     * 用户昵称
     */
    private String name;
    /**
     * 用户性别
     */
    private String sex;
    /**
     * 用户年龄
     */
    private int age;
    /**
     * 用户手机号
     */
    private String phone;

    public UserInfo(String useraccount, String userpass, short role, String name, String sex, int age, String phone) {
        this.userAccount = useraccount;
        this.userPass = userpass;
        this.role = role;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.phone = phone;
    }

    public UserInfo() {
    }

    public String getUseraccount() {
        return userAccount;
    }

    public void setUseraccount(String useraccount) {
        this.userAccount = useraccount;
    }

    public String getUserpass() {
        return userPass;
    }

    public void setUserpass(String userpass) {
        this.userPass = userpass;
    }

    public short getRole() {
        return role;
    }

    public void setRole(short role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
