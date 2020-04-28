//package com.hly.march.utils;
//
//import com.hly.march.controller.UserController;
//import com.hly.march.dto.UserSearchDTO;
//import com.hly.march.entity.BlogSeries;
//import com.hly.march.entity.Draft;
//import com.hly.march.entity.User;
//
//public class BeanPurifyUtils {
//
//    public static User purifyUserBean(User userData){
//        if(userData.getUserIp()!=null&&("".equals(userData.getUserIp().trim())||"null".equals(userData.getUserIp().trim()))){
//            userData.setUserIp(null);
//        }
//        if(userData.getUserName()!=null&&("".equals(userData.getUserName().trim())||"null".equals(userData.getUserName().trim()))){
//            userData.setUserName(null);
//        }
//        if(userData.getUserEmail()!=null&&("".equals(userData.getUserEmail().trim())||"null".equals(userData.getUserEmail().trim()))){
//            userData.setUserEmail(null);
//        }
//        if(userData.getUserProfilePic()!=null&&("".equals(userData.getUserProfilePic().trim())||"null".equals(userData.getUserProfilePic().trim()))){
//            userData.setUserProfilePic(null);
//        }
//        if(userData.getUserTelephoneNumber()!=null&&("".equals(userData.getUserTelephoneNumber().trim())||"null".equals(userData.getUserTelephoneNumber().trim()))){
//            userData.setUserTelephoneNumber(null);
//        }
//        if(userData.getUserNickname()!=null&&("".equals(userData.getUserNickname().trim())||"null".equals(userData.getUserNickname().trim()))){
//            userData.setUserNickname(null);
//        }
//        userData.setSalt(null);
//        userData.setUserSession(null);
//        userData.setUserConfig(null);
//        if(userData.getUserSex()!=null&&("".equals(userData.getUserSex().trim())||"null".equals(userData.getUserSex().trim()))){
//            userData.setUserSex(null);
//        }
//        if(userData.getUserMotto()!=null&&("".equals(userData.getUserMotto().trim())||"null".equals(userData.getUserMotto().trim()))){
//            userData.setUserMotto(null);
//        }
//        if(userData.getUserBg()!=null&&("".equals(userData.getUserBg().trim())||"null".equals(userData.getUserBg().trim()))){
//            userData.setUserBg(null);
//        }
//        if(userData.getGithubLink()!=null&&("".equals(userData.getGithubLink().trim())||"null".equals(userData.getGithubLink().trim()))){
//            userData.setGithubLink(null);
//        }
//        if(userData.getWeiboLink()!=null&&("".equals(userData.getWeiboLink().trim())||"null".equals(userData.getWeiboLink().trim()))){
//            userData.setWeiboLink(null);
//        }
//        if(userData.getWechatLink()!=null&&("".equals(userData.getWechatLink().trim())||"null".equals(userData.getWechatLink().trim()))){
//            userData.setWechatLink(null);
//        }
//        if(userData.getQqLink()!=null&&("".equals(userData.getQqLink().trim())||"null".equals(userData.getQqLink().trim()))){
//            userData.setQqLink(null);
//        }
//        if(userData.getEmailLink()!=null&&("".equals(userData.getEmailLink().trim())||"null".equals(userData.getEmailLink().trim()))){
//            userData.setEmailLink(null);
//        }
//        if(userData.getCsdnLink()!=null&&("".equals(userData.getCsdnLink().trim())||"null".equals(userData.getCsdnLink().trim()))){
//            userData.setCsdnLink(null);
//        }
//        if(userData.getOtherLink()!=null&&("".equals(userData.getOtherLink().trim())||"null".equals(userData.getOtherLink().trim()))){
//            userData.setOtherLink(null);
//        }
//        if(userData.getRemember()!=null&&("".equals(userData.getRemember().trim())||"null".equals(userData.getRemember().trim()))){
//            userData.setRemember(null);
//        }
//        if(userData.getCaptchaCode()!=null&&("".equals(userData.getCaptchaCode().trim())||"null".equals(userData.getCaptchaCode().trim()))){
//            userData.setCaptchaCode(null);
//        }
//        if(userData.getNewPassword()!=null&&("".equals(userData.getNewPassword().trim())||"null".equals(userData.getNewPassword().trim()))){
//            userData.setNewPassword(null);
//        }
//        if(userData.getAccount()!=null&&("".equals(userData.getAccount().trim())||"null".equals(userData.getAccount().trim()))){
//            userData.setAccount(null);
//        }
//        if(userData.getUserRights()!=null&&(userData.getUserRights()< UserController.RolesEnum.SUPER_ADMIN_ROLE.getCode()||userData.getUserRights()> UserController.RolesEnum.LEVEL_1_ROLE.getCode())){
//            userData.setUserRights(null);
//        }
//        if(userData.getAccountStatus()!=null&&(userData.getAccountStatus()< UserController.AccountStatusEnum.NORMAL_STATUS.getCode()||userData.getAccountStatus()> UserController.AccountStatusEnum.FORBIDDEN_STATUS.getCode())){
//            userData.setAccount(null);
//        }
//        if(userData.getInvitationCode()!=null&&("".equals(userData.getInvitationCode().trim())||"null".equals(userData.getInvitationCode().trim()))){
//            userData.setInvitationCode(null);
//        }
//        return userData;
//    }
//
//    public static BlogSeries purifyBlogSeriesBean(BlogSeries blogSeriesData){
//        blogSeriesData.setSeriesShortName(purifyStr(blogSeriesData.getSeriesShortName()));
//        blogSeriesData.setSeriesName(purifyStr(blogSeriesData.getSeriesName()));
//        blogSeriesData.setSeriesLink(purifyStr(blogSeriesData.getSeriesLink()));
//        blogSeriesData.setSeriesIntro(purifyStr(blogSeriesData.getSeriesIntro()));
//        blogSeriesData.setNewSeriesName(purifyStr(blogSeriesData.getNewSeriesName()));
//        return blogSeriesData;
//    }
//
//    public static Draft purifyDraftBean(Draft draft){
//        draft.setBlogTitle(purifyStr(draft.getBlogTitle()));
//        draft.setBlogIntro(purifyStr(draft.getBlogIntro()));
//        draft.setBlogMedia(purifyStr(draft.getBlogMedia()));
//        draft.setBlogTag(purifyStr(draft.getBlogTag()));
//        draft.setBlogInfo(purifyStr(draft.getBlogInfo()));
//        draft.setSourceFrom(purifyStr(draft.getSourceFrom()));
//        return draft;
//    }
//
//    public static UserSearchDTO purifyUserSearchDTO(UserSearchDTO data){
//        data.setUserIp(purifyStr(data.getUserIp()));
//        data.setUserName(purifyStr(data.getUserName()));
//        data.setUserEmail(purifyStr(data.getUserEmail()));
//        data.setUserProfilePic(purifyStr(data.getUserProfilePic()));
////        data.set(purifyStr(data.getUserRights()));
//        data.setUserProfilePic(purifyStr(data.getUserProfilePic()));
//        data.setUserProfilePic(purifyStr(data.getUserProfilePic()));
//        data.setUserProfilePic(purifyStr(data.getUserProfilePic()));
//        data.setUserProfilePic(purifyStr(data.getUserProfilePic()));
//
//        return data;
//    }
//
//    private static String purifyStr(String str){
//        if(str!=null&&("".equals(str.trim())||"null".equals(str.trim()))){
//           return null;
//        }else{
//            return str;
//        }
//    }
//}
