import { NavigationItemType, LoginItemType, ButtonType } from "../types";
import { siteInfoSectionType } from "../types/section";

export const siteInfo: siteInfoSectionType = {
  title: "倉庫管理システム",
};

// export const Buttons:

export const loginFileds: LoginItemType = {
  username: "ログインID",
  password: "パスワード",
  rememberme: "remember me",
};

export const cardTopics: string[] = [
  "１．入庫処理",
  "４．入金処理",
  "２．出庫処理",
  "５．請求処理",
  "３．倉庫管理",
  "６．マスタ保守",
];

export const navigations: NavigationItemType[] = [
  {
    label: "TOP",
    key: "/",
    url: "/",
  },
  {
    label: "入庫処理",
    key: "/in_process",
    url: "/in_process",
  },
  {
    label: "出庫処理",
    key: "/configout_process",
    url: "/out_process",
  },
  {
    label: "在庫管理",
    key: "/inventory_control",
    url: "/inventory_control",
  },
  {
    label: "入金処理",
    key: "/deposit_process",
    url: "/deposit_process",
  },
  {
    label: "請求処理",
    key: "/billing_process",
    url: "/billing_process",
  },
  {
    label: "マスタ保守",
    key: "/maintenence",
    url: "/maintenence",
  },
];