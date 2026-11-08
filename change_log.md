# 變更紀錄

記錄 AI Model API Pricing Directory 網站嘅建立、功能更新同介面調整。

## 2026-11-08

- 建立公開 GitHub repository，將 `ai_compare.html` 上傳，並新增 `index.html` 作為網站入口；啟用 GitHub Pages。
- 曾將費用估算器標題由「即時 API 費用估算器」改為「費用估算器」；之後應要求移除整個估算器區塊，並清除相關程式碼。
- 將預設貨幣由 AUD 改為 USD。
- 將模型目錄資料來源改為 OpenRouter 公開 API：載入模型名稱、供應商、價格及說明；價格可切換 USD、AUD、HKD，模型清單支援搜尋及供應商篩選。
- 加入 OpenRouter 模型頁連結、資料載入狀態及來源說明；價格標示為 OpenRouter 報價，唔代表模型供應商直接報價。
- 設定預設顯示以下 8 款模型，並保留切換至完整 OpenRouter 型錄嘅選項：
  - OpenAI GPT-6.1 Sol、GPT-6 Luna、GPT-6.1 Terra
  - Anthropic Claude Opus 5.5、Sonnet 5.5、Haiku 5.5
  - DeepSeek V4.1 Flash
  - MoonshotAI Kimi K3.1 Pro
- 為以上 8 款預設模型加入繁體中文說明；英文介面顯示 OpenRouter 原文。
- 加入 Gemini 4 Argon 至預設指定模型清單，並為模型提供繁體中文說明；價格由 OpenRouter API 即時載入。
- 加入白色／黑色背景切換按鈕，按鈕文字會配合中英文介面更新。
- 從價格表移除「模型 ID」欄，但保留按模型 ID 搜尋。
- 移除頁面頂部嘅最低輸入／輸出價格、平均價及模型數量統計卡片。
- `index.html` 同 `ai_compare.html` 保持同步。

## 發佈紀錄

- GitHub Pages 網址：[https://tomwong-au1.github.io/ai-compare/](https://tomwong-au1.github.io/ai-compare/)
- 以上網站更新已推送至 `main` 分支。
