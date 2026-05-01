# 📖 EcoServe Platform - Complete Installation Guide

**Full step-by-step guide to get EcoServe running on your machine.**

---

## Prerequisites

Before starting, ensure you have:

### Required
- ✅ **Node.js 18+** - [Download](https://nodejs.org/)
- ✅ **npm 8+** - Comes with Node.js
- ✅ **Git** - [Download](https://git-scm.com/) (optional)

### Recommended
- ✅ **VS Code** - [Download](https://code.visualstudio.com/)
- ✅ **Postman** - For API testing [Download](https://www.postman.com/)

### Check Your Installation

**Windows (CMD or PowerShell):**
```cmd
node --version
npm --version
```

**macOS/Linux (Terminal):**
```bash
node --version
npm --version
```

Expected output: `v18.x.x` and `8.x.x` or higher

---

## Step 1: Get the Project

### Option A: Clone from GitHub
```bash
git clone https://github.com/yourusername/ecoserve.git
cd vega
```

### Option B: Use Existing Directory
```bash
cd c:\Users\AHT\Downloads\vega
# or: cd /path/to/vega
```

---

## Step 2: Install Dependencies

This step downloads all required packages (~500MB).

```bash
npm install
```

**What's happening:**
- Downloads React, Vite, Firebase, Express, and 50+ other packages
- Creates `node_modules/` folder
- Generates `package-lock.json`

**If it fails:**
```bash
# Clear npm cache
npm cache clean --force

# Try again with verbose output
npm install --verbose

# Or use alternative registry
npm install --registry https://registry.npmjs.org/
```

**Expected time:** 2-5 minutes depending on internet speed

---

## Step 3: Configure Environment

### Create .env.local File

**Windows (PowerShell):**
```powershell
New-Item .env.local -Force
# Edit it:
notepad .env.local
```

**Windows (CMD):**
```cmd
type nul > .env.local
# Edit it:
notepad .env.local
```

**macOS/Linux:**
```bash
touch .env.local
nano .env.local  # or use your favorite editor
```

### Add Required Configuration

Copy this minimal configuration to `.env.local`:

```env
# ========================================
# FIREBASE (Required)
# ========================================
VITE_FIREBASE_API_KEY=AIzaSyD7cD0GuG5FBP-nawRxTNqlkreAnTZaC9c
VITE_FIREBASE_AUTH_DOMAIN=ecoserve-aed68.firebaseapp.com
VITE_FIREBASE_PROJECT_ID=ecoserve-aed68
VITE_FIREBASE_STORAGE_BUCKET=ecoserve-aed68.firebasestorage.app
VITE_FIREBASE_MESSAGING_SENDER_ID=559330850646
VITE_FIREBASE_APP_ID=1:559330850646:web:01a1133dd9a8aac43e08f7
VITE_FIREBASE_MEASUREMENT_ID=G-62WQSD7DWM

# ========================================
# API CONFIGURATION (Required)
# ========================================
VITE_API_BASE_URL=http://localhost:5000/api
NODE_ENV=development
PORT=5000

# ========================================
# OPTIONAL SERVICES
# (Add your API keys from services)
# ========================================

# EmailJS - For email notifications
VITE_EMAILJS_SERVICE_ID=service_kombine
VITE_EMAILJS_TEMPLATE_ID=template_zlzfbu5
VITE_EMAILJS_PUBLIC_KEY=hIEqZqsWSFRoK-zit

# Telegram Bot - For instant notifications
TELEGRAM_BOT_TOKEN=8755802728:AAH9fEaJ8hUwLvd0AuLvaTKPfjN1yQlTYNQ
TELEGRAM_CHAT_ID=8469762018

# Razorpay - For payments (use test keys)
VITE_RAZORPAY_KEY_ID=rzp_test_xxxxx
RAZORPAY_KEY_SECRET=your_secret

# Google Maps - For location services
VITE_GOOGLE_MAPS_API_KEY=your_key

# Gemini AI - For advanced features
GEMINI_API_KEY=your_key
```

**Save the file** (Ctrl+S or Cmd+S)

---

## Step 4: Verify Installation

### Run Validation Script

**Windows (PowerShell - Administrator):**
```powershell
.\setup-validator.bat
```

**Windows (CMD):**
```cmd
setup-validator.bat
```

**macOS/Linux:**
```bash
chmod +x setup-validator.sh
./setup-validator.sh
```

### Expected Output
```
✓ Node.js installed: v18.x.x
✓ npm installed: 8.x.x
✓ Dependencies installed
✓ .env.local file exists
✓ Firebase configuration found
✓ src/ directory found
✓ server.js found
✓ index.html found

✓ All checks passed!
```

---

## Step 5: Start Development Server

### Run Both Frontend & Backend

```bash
npm run dev
```

**What happens:**
1. Vite starts on `http://localhost:5173`
2. Express starts on `http://localhost:5000`
3. Hot-reload enabled for development
4. Both open automatically (if configured)

**Expected output:**
```
  VITE v6.x.x  ready in 200 ms

  ➜  Local:   http://localhost:5173/
  ➜  press h + enter to show help

[timestamp] GET / 200 - 2ms
[timestamp] GET /api/health 200 - 5ms

╔════════════════════════════════════════╗
║     EcoServe Backend Server Online     ║
╚════════════════════════════════════════╝

  🚀 Environment: development
  📍 Port: 5000
  🌐 URL: http://localhost:5000
```

---

## Step 6: Access the Application

### Open in Browser

1. **Frontend**: http://localhost:5173
   - Should see EcoServe landing page
   - Navbar with menu works
   - All animations smooth
   - No errors in console

2. **Backend API**: http://localhost:5000/api/health
   - Should return JSON response
   - Shows healthy status

### Test Navigation

- [ ] Click menu button (top center)
- [ ] See expandable menu
- [ ] Click "Join as Restaurant"
- [ ] Click "Join as NGO"
- [ ] Menu closes
- [ ] Navigation works

---

## Step 7: Development Workflow

### Edit Code

1. Open project folder in VS Code:
   ```bash
   code .
   ```

2. Edit files in `src/components/` or `src/lib/`

3. Changes auto-refresh in browser (Hot Module Replacement)

### Common Development Tasks

```bash
# Start development
npm run dev

# Just frontend (Vite)
npm run dev:frontend

# Just backend (Express)
npm run dev:backend

# Type checking
npm run type-check

# Build production
npm run build

# Preview production build
npm run preview
```

---

## Step 8: Build for Production

When ready to deploy:

```bash
# Create optimized production build
npm run build
```

**What happens:**
1. TypeScript compiled to JavaScript
2. React components optimized
3. CSS minified
4. Assets compressed
5. Output in `dist/` folder

**Expected:**
```
✓ 5 modules transformed.

dist/index.html                    0.90 kB │ gzip:   0.32 kB
dist/assets/main-xxxxx.js        45.23 kB │ gzip:  14.32 kB
dist/assets/vendor-xxxxx.js     150.32 kB │ gzip:  45.23 kB
dist/assets/main-xxxxx.css       12.34 kB │ gzip:   3.45 kB
```

---

## Step 9: Deploy to Production

### Vercel Deployment (Recommended)

1. **Create Vercel account**: https://vercel.com

2. **Install Vercel CLI**:
   ```bash
   npm install -g vercel
   ```

3. **Deploy**:
   ```bash
   vercel --prod
   ```

4. **Add Environment Variables**:
   - Go to Vercel Dashboard
   - Settings → Environment Variables
   - Add variables from `.env.local`

5. **Your app is live!**:
   - URL: `https://your-project.vercel.app`

### Alternative: Docker

```bash
# Build image
docker build -t ecoserve .

# Run container
docker run -p 5000:5000 ecoserve

# Visit http://localhost:5000
```

### Alternative: Self-Hosted

See [DEPLOYMENT.md](./DEPLOYMENT.md) for complete self-hosting guide.

---

## 🐛 Troubleshooting

### Problem: Port 5000 Already in Use

**Windows:**
```cmd
netstat -ano | findstr :5000
taskkill /PID <PID> /F
```

**macOS/Linux:**
```bash
lsof -i :5000
kill -9 <PID>
```

### Problem: npm install Fails

```bash
# Clear cache
npm cache clean --force

# Delete lock file
rm package-lock.json

# Retry
npm install
```

### Problem: Module Not Found Error

```bash
# Delete node_modules
rm -r node_modules

# Reinstall
npm install
```

### Problem: CORS Errors

1. Ensure backend is running: `npm run dev:backend`
2. Check `.env.local` has correct API URL
3. Restart both frontend and backend

### Problem: Firebase Connection Error

1. Verify API keys in `.env.local`
2. Check Firebase project in console
3. Ensure Firestore database exists
4. Check security rules allow public read/write (dev only)

### Problem: Build Fails

```bash
# Full clean rebuild
rm -rf node_modules dist package-lock.json
npm cache clean --force
npm install
npm run build
```

---

## ✅ Installation Checklist

- [ ] Node.js 18+ installed
- [ ] npm 8+ installed
- [ ] Project folder exists
- [ ] `npm install` completed successfully
- [ ] `.env.local` created with API keys
- [ ] Validation script passed
- [ ] `npm run dev` works
- [ ] Frontend loads on http://localhost:5173
- [ ] Backend responds on http://localhost:5000
- [ ] Navigation works
- [ ] No console errors

---

## 📞 Getting Help

If you encounter issues:

1. **Read**: [DEPLOYMENT.md](./DEPLOYMENT.md) - Comprehensive guide
2. **Check**: [QUICKSTART.md](./QUICKSTART.md) - Quick reference
3. **Review**: This file - Common problems
4. **Logs**: Check terminal output for errors

---

## 🎉 Next Steps

Once installation is complete:

1. **Explore Code**: Read `src/App.tsx` and components
2. **Modify UI**: Edit components in `src/components/`
3. **Add Features**: Implement new API endpoints in `server.js`
4. **Test APIs**: Use Postman to test endpoints
5. **Deploy**: Follow deployment section above

---

**🚀 You're all set! Start building with EcoServe!**

Questions? See documentation or contact the team.

**Reduce Food Waste. Feed Lives. 🌱**

---

**Last Updated**: May 2024  
**Version**: 1.0.0
