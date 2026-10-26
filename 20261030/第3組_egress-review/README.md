# 逃生動線檢討台

**第一次拿到這個資料夾，先讀 [`開始這裡.md`](開始這裡.md)。**

## 資料夾內容

```
egress-review/
├─ 開始這裡.md              ← 先讀這份，選自己的角色
├─ AGENTS.md / CLAUDE.md    給 AI 助手看的規則
├─ check.js                 commit 前執行，只抓會造成 bug 的問題【不能改】
├─ ownership.json           誰主要負責哪些檔案【不能改】
├─ lock.json                接口檔案的指紋（改完接口執行 node check.js --relock）
├─ docs/
│   ├─ 計畫書.md            產品與技術計畫 0.1
│   ├─ 整合規則.md          只統一這 20 個會造成 bug 的點，其他自由
│   ├─ AI改程式流程.md      用 AI 改程式只統一的四件事
│   ├─ data-contract.md     資料填寫說明
│   └─ 分工與時程.md         每天做什麼、怎麼合併
├─ regs/                    【C】法規原文（§92、§93）、rules.json 規則包
├─ engine/
│   ├─ geometry.js          【B】最遠點、路線、距離、轉向角
│   ├─ rules.js             【C】法規判定、設計提示
│   └─ review.js            【共用】把兩者串成檢討批次
├─ src/page.html            【D】介面原始碼
├─ plugin/                  【A】Revit 外掛（還沒建）
├─ data/                    三份範例 JSON
├─ make_samples.js          產生 data/ 範例
└─ build.js                 組出網頁
```

## 改完怎麼看結果

需要 Node.js 20 以上（課程本來就要裝）。在這個資料夾開終端機：

```
node build.js
```

再雙擊 `egress-review-standalone.html` 用瀏覽器打開。

**不要直接改** `egress-review.html` 和 `egress-review-standalone.html`。這兩份是 `build.js` 自動產生的，改了會被蓋掉。
