# 🚀 EcoServe Platform - QUICKSTART GUIDE

**Get up and running in 5 minutes!**

---

## ⚡ 5-Minute Setup

### 1. Clone/Navigate to Project
```bash
cd vega
```

### 2. Install Dependencies (2-3 min)
```bash
npm install
```

### 3. Run Development Server
```bash
npm run dev
```

### 4. Open in Browser
- **Frontend**: http://localhost:5173
- **Backend**: http://localhost:5000/api/health

✅ **Done!** Your EcoServe platform is running.

---

## 📋 Environment Setup (Optional)

If you want to enable API features:

1. Open `.env.local`
2. Add your API keys:
   ```env
   VITE_FIREBASE_API_KEY=your_key_here
   VITE_EMAILJS_SERVICE_ID=your_service_id
   TELEGRAM_BOT_TOKEN=your_telegram_token
   ```
3. Save file
4. Restart server: `npm run dev`

---

## 🎯 Common Tasks

### Start Development
```bash
npm run dev
```

### Build for Production
```bash
npm run build
```

### Preview Production Build
```bash
npm run preview
```

### Deploy to Vercel
```bash
npm install -g vercel
vercel --prod
```

### Just Frontend
```bash
npm run dev:frontend
```

### Just Backend
```bash
npm run dev:backend
```

---

## 🐛 Quick Troubleshooting

| Issue | Solution |
|-------|----------|
| Port 5000/5173 in use | Kill process or use different port |
| `npm install` fails | `npm cache clean --force` then retry |
| CORS errors | Ensure backend is running |
| Firebase not connecting | Check API keys in `.env.local` |
| Build fails | `rm -rf node_modules && npm install` |

---

## 📊 Project URLs

| Service | URL |
|---------|-----|
| Frontend | http://localhost:5173 |
| Backend | http://localhost:5000 |
| API Health | http://localhost:5000/api/health |

---

## 🔧 Available Commands

```bash
npm run dev              # Start everything
npm run dev:frontend    # Frontend only  
npm run dev:backend     # Backend only
npm run build           # Production build
npm run preview         # Test production build
npm run lint            # TypeScript check
npm run start           # Production server
npm run deploy          # Deploy to Vercel
```

---

## 📚 Full Documentation

- **Setup Guide**: See [README.md](./README.md)
- **Deployment**: See [DEPLOYMENT.md](./DEPLOYMENT.md)
- **API Reference**: See [DEPLOYMENT.md](./DEPLOYMENT.md#-api-documentation)

---

## ✨ Features

- ✅ Real-time Firebase Firestore sync
- ✅ Live delivery tracking maps
- ✅ Payment processing (Razorpay)
- ✅ Email notifications (EmailJS)
- ✅ Telegram alerts
- ✅ Carbon tracking
- ✅ Mobile responsive
- ✅ Production-ready

---

## 💡 Tips

1. **Hot Reload**: Code changes auto-refresh (thanks Vite!)
2. **Environment**: Changes to `.env.local` require server restart
3. **Build**: Always run `npm run build` before production deployment
4. **Performance**: Open DevTools (F12) to check bundle size
5. **TypeScript**: Run `npm run type-check` to catch errors early

---

## 🆘 Need Help?

1. Check [DEPLOYMENT.md](./DEPLOYMENT.md) for detailed troubleshooting
2. View backend logs in terminal running `npm run dev:backend`
3. Open browser DevTools (F12) for frontend errors
4. Check `.env.local` for missing API keys

---

**🎉 You're ready to build EcoServe!**

**Reduce Food Waste. Feed Lives. 🌱**
