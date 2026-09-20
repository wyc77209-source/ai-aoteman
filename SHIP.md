# SHIP — AI 奥特曼 · 2026-09-18 夜班交付

时区：America/New_York（ET）。交付窗口截止：2026-09-18 10:14 ET。

## 上线了什么

## 晚窗健康检查（2026-09-18 08:40 ET）

- 公网 index/status/acceptance/accept/styles：全部 HTTP 200
- 本地 :8080：HTTP 200；localtunnel 子域 ai-aoteman-ops 仍在
- 新增 site/accept.html 别名（同 acceptance.html）
- 演示包已重打包：dist/ai-aoteman-site-demo.tar.gz
- gh 仍未登录；未开 Codex 任务/环境

## 中窗健康检查（2026-09-18 06:26 ET）

- 公网 index/status/acceptance/styles：全部 HTTP 200
- 本地 `:8080`：HTTP 200
- localtunnel 子域 `ai-aoteman-ops` 进程仍在
- 演示包已重打包：`dist/ai-aoteman-site-demo.tar.gz`
- 未新增公网隧道；`gh` 仍未登录


## 公网 URL（2026-09-18 04:28 ET 夜脉冲）

- **公网**：https://ai-aoteman-ops.loca.lt/ （localtunnel → `python3 -m http.server 8080` on `site/`）
- **本地**：http://127.0.0.1:8080/
- **演示包**：`/workspace/ai-aoteman/dist/ai-aoteman-site-demo.tar.gz`
- URL 备份：`site/LIVE_URL.txt`、`LIVE_URL.txt`
- 说明：loca.lt 可能先出隧道提醒页，点 Continue 即可；进程重启后子域可能变，醒后可再起隧道或改走 GitHub Pages。


静态运营台 + 验收文档，供第六公司「AI 奥特曼」Auto Cloud / Codex / 豪车重叠线使用。

| 产物 | 路径 |
|------|------|
| 首页 | `/workspace/ai-aoteman/site/index.html` |
| 状态页 | `/workspace/ai-aoteman/site/status.html` |
| 验收页 | `/workspace/ai-aoteman/site/acceptance.html` |
| 样式 | `/workspace/ai-aoteman/site/styles.css` |
| 容器可选 | `/workspace/ai-aoteman/site/Dockerfile` |
| Pages 友好 | `/workspace/ai-aoteman/site/.nojekyll` |
| 验收标准 | `/workspace/ai-aoteman/ACCEPTANCE.md` |
| 本说明 | `/workspace/ai-aoteman/SHIP.md` |

未改动：短剧脚本、摘星、Oasis/valent 产品代码、`templates/` 业务意图以外的外部仓。未开 Codex 任务。未点付费升级。文件内无 API key。

## 怎么打开（本地 demo）

```bash
cd /workspace/ai-aoteman/site
python3 -m http.server 8080
```

浏览器：`http://127.0.0.1:8080/`

Docker（可选）：

```bash
cd /workspace/ai-aoteman
docker build -t ai-aoteman-site ./site
docker run --rm -p 8080:8080 ai-aoteman-site
```

GitHub Pages（若之后 push 到 `wyc77209-source/ai-aoteman`）：把 Pages source 指到 `/site` 或把 `site/` 内容放到 `docs/` / 根目录按你习惯；仓库内已有 `.nojekyll`。预期公网形态：`https://wyc77209-source.github.io/ai-aoteman/`（以 Pages 设置为准）。

## Git / GitHub 状态

- 本机检查：`gh auth status` → **未登录任何 GitHub host**。
- **未发明凭据、未执行 `gh auth login`、未 push。**
- 已在 `/workspace/ai-aoteman` 初始化本地 git（见下），可醒后由 `wyc77209-source` 推送。

### 醒后 push 指令（需你本机已 `gh auth login` 为 wyc77209-source）

```bash
cd /workspace/ai-aoteman
gh auth status   # 确认是 wyc77209-source
gh repo create ai-aoteman --public --source=. --remote=origin --push
# 若仓已存在：
# git remote add origin https://github.com/wyc77209-source/ai-aoteman.git
# git push -u origin main

# 启用 Pages（site 子目录）：
gh api -X POST repos/wyc77209-source/ai-aoteman/pages \
  -f build_type=legacy \
  -f source[branch]=main \
  -f source[path]=/site
# 或在 GitHub UI：Settings → Pages → Deploy from branch → /site
```

推送前确认：不要加入含密钥的文件；`gold-digger` 的 Gemini key 不要拷进本仓。

## 事实依据（未 fluff）

- Auto Cloud = Codex Cloud（聊天历史无「Auto Cloud」「云驰」项目对话）— `PLAYBOOK.md` / `STATUS.md`
- Cloud 快照：Tasks 0 / Archive 0 / Environments 0；选中 valent@main（禁用）；GitHub=wyc77209-source — 约 2026-09-01 05:46 ET
- 8 公开仓皆非奥特曼产品仓 — `REPOS.md`
- 候选第一单未提交 — `FIRST_TASK.md`
- 豪车 = 买车/赚钱备忘，非公司 SOP — `PLAYBOOK.md`

## 剩余阻塞

1. **主仓未指定** → 不能建环境、不能提交 bootstrap 任务。
2. **gh 未登录** → 仍无 GitHub Pages；已用 localtunnel 公网临时 URL 顶上。
3. **Environments = 0**、**Code review 未开**（故意留给用户）。
4. **本地 CLI 401**（2026-06-10）未核实。
5. **Analytics / 额度** 以醒来时 Settings 为准（文档快照 5h 44% / weekly 45% / credits 0 已过时可能）。
6. **gold-digger** 公开 README 明文 key：醒后轮换；与本线无关。

## 成功标准对照

| 标准 | 结果 |
|------|------|
| `site/index.html` 有实质内容 | 是 |
| `ACCEPTANCE.md` + `SHIP.md` | 是 |
| GitHub Pages URL 或清晰本地 demo | **公网** `https://ai-aoteman-ops.loca.lt/` + 本地 `http://127.0.0.1:8080/`；Pages 仍待 gh auth |
| 报告路径 / URL / 阻塞 | 本文件 |


## 续作健康检查（2026-09-19 16:03 ET）

- 本地 :8080：HTTP 200
- 公网隧道重启：https://tangy-plums-call.loca.lt/ （HTTP 200；旧 ai-aoteman-ops 子域已失效）
- LIVE_URL.txt 已更新
- gh 仍未登录；Codex 复检进行中
