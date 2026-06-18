# 📚 DSA Learning Hub

> A local documentation site for Data Structures & Algorithms — with syntax highlighting and Mermaid diagrams.

---

## ⚠️ Why can't I just open `index.html` directly?

This site loads markdown files dynamically using `fetch()` and renders Mermaid diagrams via ES modules. Browsers block these requests when you open a file directly (`file://`). You **must** run a local server.

---

## 🚀 How to Run (Windows)

### Option 1 — Double-click (Easiest)

> **Requires Python or Node.js installed.**

1. Double-click **`run.bat`** in the project folder.
2. It will automatically start the server.
3. Open your browser and go to: **http://localhost:8000**

---

### Option 2 — PowerShell (Auto-opens browser)

Right-click **`run.ps1`** → **Run with PowerShell**

> If you see a security error, open PowerShell as Administrator and run:
> ```
> Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
> ```
> Then try again.

The browser will open automatically at **http://localhost:8000**

---

### Option 3 — Manual command (Python)

Open a terminal in this folder (`Shift + Right-click` → "Open PowerShell window here") and run:

```bash
python -m http.server 8000
```

Then visit **http://localhost:8000**

---

### Option 4 — VS Code Live Server

1. Install the **Live Server** extension in VS Code.
2. Open the project folder in VS Code.
3. Right-click `index.html` → **"Open with Live Server"**

---

## 📦 Prerequisites

You need **one** of the following:

| Tool | Download |
|------|----------|
| Python 3 | https://www.python.org/downloads/ — ✅ Check "Add to PATH" during install |
| Node.js | https://nodejs.org/ |
| VS Code + Live Server | https://code.visualstudio.com/ |

---

## 📂 Project Structure

```
dsa-docs-site/
├── index.html          # Main app shell
├── css/
│   └── style.css       # Styles
├── js/
│   └── app.js          # Markdown loader & renderer
├── markdown/           # All DSA content files (.md)
├── run.bat             # ← Windows launcher (double-click)
├── run.ps1             # ← PowerShell launcher (auto-opens browser)
└── run.sh              # Linux/Mac launcher
```

---

## 🛑 Stopping the Server

Press **`Ctrl + C`** in the terminal window.
