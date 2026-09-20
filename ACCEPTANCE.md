# ACCEPTANCE — AI 奥特曼 · Auto Cloud 运营台（2026-09-18）

窗口：到 2026-09-18 10:14 America/New_York。范围仅 Auto Cloud / ChatGPT Codex / 豪车重叠。

## 验收对象

| 路径 | 作用 |
|------|------|
| `site/index.html` | 中文首页：本线定义 + 硬门 + 豪车重叠（已知未知） |
| `site/status.html` | 状态页：登录 / Tasks / Environments / 选中仓 / 8 仓盘点 |
| `site/acceptance.html` | 本清单的网页版 |
| `site/accept.html` | 同上别名（防短路径 404） |
| `site/styles.css` | 样式（移动端可用） |
| `site/Dockerfile` | 可选容器服务静态文件 |
| `ACCEPTANCE.md` | 本文件 |
| `SHIP.md` | 上线说明与阻塞 |

## Pass 标准（本批必须全绿）

1. **首页可打开**：`site/index.html` 存在，文案明确「Auto Cloud = Codex Cloud + 豪车协同」。
2. **中文 UI / 移动端**：导航可点，卡片布局在窄屏不炸（CSS `auto-fit` + sticky nav）。
3. **状态页有事实**：Tasks 0、Archive 0、Environments 0、logged_in TE/Plus、选中 `valent@main` 且标注禁用、已连 8 仓非奥特曼主仓——与 `STATUS.md` / `PLAYBOOK.md` / `REPOS.md` 一致（文档快照约 2026-09-01 05:46 ET）。
4. **验收页可勾**：列出本批 PASS 与仍 BLOCKED 项；含 `https://chatgpt.com/codex/cloud` 链接。
5. **豪车不编造**：只链已知对话（兰博基尼方案 / 甜蜜与苦涩 / ETH GT3 RS）；写明公司名、形态、库存为已知未知；不发明公司 SOP。
6. **公网可开**（夜班）：`https://ai-aoteman-ops.loca.lt/`（localtunnel；提醒页点 Continue）。
7. **本地可跑**：
   ```bash
   cd /workspace/ai-aoteman/site
   python3 -m http.server 8080
   # 打开 http://127.0.0.1:8080/
   ```
8. **无密钥**：仓库内无新增 API key / `.env` / token；不拷贝 gold-digger Gemini key。
9. **范围遵守**：未改短剧脚本、摘星交易、Oasis/valent 产品代码；未在 Codex 创建任务；未点 Enable code review；未买 credits / 付费升级。
10. **文档齐全**：根目录 `ACCEPTANCE.md` + `SHIP.md` 已写。

## Fail 条件（任一即本批失败）

- 缺少 `site/index.html` 或首页无实质内容。
- 把豪车写成已成立公司并编了名称/库存。
- 在 valent 上开了 Codex 任务，或把密钥写进文件。
- 碰了短剧 / 摘星 / Oasis 产品代码。

## 不算本批失败的阻塞

- 主仓未指定 → 不能 Create environment / 不能提交 `ai-aoteman-codex-bootstrap`。
- `gh` 未登录 → 无 GitHub Pages；夜班用 localtunnel 公网 URL 顶上（见 SHIP.md / LIVE_URL.txt）。
- 本地 Codex CLI `401 invalid_api_key`（2026-06-10）未核实。

## Demo 步骤（验收人）

1. 公网：打开 `https://ai-aoteman-ops.loca.lt/`（遇 loca.lt 提醒点 Continue）。
2. 或本地：`cd /workspace/ai-aoteman/site && python3 -m http.server 8080` → `http://127.0.0.1:8080/`。
3. 打开「状态」→ 核对 Tasks/Environments/valent 禁用。
4. 打开「验收清单」→ 对照本文件 Pass 标准。
5. 点「Codex Cloud」外链（需用户会话；验收人不创建任务）。
6. 可选：`docker build -t ai-aoteman-site ./site && docker run --rm -p 8080:8080 ai-aoteman-site`

## 醒后拍板（非本批强制）

见 `NEXT.md` / `PLAYBOOK.md`：主仓、环境、第一单、Code review、Analytics、CLI 401、gold-digger key 轮换、豪车保持备忘。
