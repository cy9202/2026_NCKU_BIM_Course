# Revit BIM 協作與法規檢討

這個儲存庫整理了目前的 Revit RFI 協作工具，以及逃生距離法規檢討的計畫和介面原型。

## 專案內容

- [`rfi-team/`](rfi-team/README.md)：RFI 協作圖台、Go 後端與 Revit 外掛原始碼。
- [`docs/egress-distance-development-plan.md`](docs/egress-distance-development-plan.md)：以 Revit 模型資料執行建築防火避難法規檢討的開發計畫。
- [`prototypes/egress-review-prototype.html`](prototypes/egress-review-prototype.html)：逃生距離檢討介面原型，使用示意資料，尚未連接 Revit。

**目前只有 RFI 協作功能有程式原始碼。** 逃生距離檢討仍是計畫與前端原型，尚未實作法規規則引擎、幾何路徑計算或 Revit 圖面回寫。

## RFI 圖台快速啟動

Windows 開發環境需要 Go 1.24、Node.js 20 或更新的 LTS 版本，以及 npm。

```powershell
cd rfi-team
.\start.ps1
```

首次啟動會安裝前端依賴並啟動本機 Go 後端和 Vite 前端。瀏覽器開啟 `http://localhost:5173`。資料庫、截圖與模型檔會寫在本機 `data/` 目錄，這些執行資料不納入 Git。

## Revit 外掛建置

外掛需要相同版本的 Revit 安裝目錄，以引用該版 `RevitAPI.dll` 和 `RevitAPIUI.dll`。

```powershell
cd rfi-team\revit-plugin
dotnet build -c Release.R24
.\install.ps1 -Version 2024
```

Revit 2026 使用 `Release.R26` 和 `-Version 2026`。Revit 2027 專案另列於 `RfiPlugin.Revit2027.csproj`，目前是獨立建置目標。

## 來源與授權

RFI 範例沿用 `dadajin666/2026_NCKU_BIM_Course` 的課程骨架，原始版本標記為 `c099fcfc61560cb00ed81e91c68f753e86423c67`，並依 MIT License 保留授權文字。這份儲存庫內有修改及新增內容，請一併查看根目錄 [`LICENSE`](LICENSE)。

法規計畫引用使用者提供的長庚大學消防管理頁面，並以全國法規資料庫作現行法規核對來源；法規條件仍需由建築/消防專業人員確認。
