# EcoServe Platform - Complete Setup & Deployment Guide

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ installed
- npm or yarn package manager
- Git (optional, for version control)

### 1. Installation

```bash
# Navigate to project directory
cd vega

# Install all dependencies (frontend + backend)
npm install

# If npm install fails, try clearing cache
npm cache clean --force
npm install
```

### 2. Development Environment Setup

Create `.env.local` file (already provided) with your API keys:

```env
# Firebase
VITE_FIREBASE_API_KEY=your_key
VITE_FIREBASE_AUTH_DOMAIN=your_domain
# ... (see .env.local for all variables)

# Email Service
VITE_EMAILJS_SERVICE_ID=your_service_id
VITE_EMAILJS_TEMPLATE_ID=your_template_id

# Telegram Bot
TELEGRAM_BOT_TOKEN=your_token
TELEGRAM_CHAT_ID=your_chat_id

# Razorpay (Payments)
VITE_RAZORPAY_KEY_ID=your_key
RAZORPAY_KEY_SECRET=your_secret
```

### 3. Running Locally

**Option A: Run Both Frontend & Backend Together**
```bash
npm run dev
```

This starts:
- ✅ Frontend (Vite): http://localhost:5173
- ✅ Backend (Express): http://localhost:5000
- ✅ API Proxy: /api routes → http://localhost:5000/api

**Option B: Run Separately (for debugging)**

Terminal 1 - Frontend:
```bash
npm run dev:frontend
```

Terminal 2 - Backend:
```bash
npm run dev:backend
```

### 4. Verify Installation

Check both servers are running:

```bash
# Frontend: Open browser
http://localhost:5173

# Backend Health Check
curl http://localhost:5000/api/health

# Expected Response:
{
  "status": "healthy",
  "timestamp": "2024-05-01T...",
  "uptime": 1.234,
  "environment": "development"
}
```

---

## 📁 Project Structure

```
vega/
├── server.js                 # Express backend server
├── src/
│   ├── main.tsx             # React entry point
│   ├── App.tsx              # Main App component
│   ├── index.css            # Global styles (Tailwind + custom)
│   ├── components/          # React components
│   │   ├── Home.tsx
│   │   ├── RestaurantDashboard.tsx
│   │   ├── NGODashboard.tsx
│   │   ├── DeliveryDashboard.tsx
│   │   ├── Marketing.tsx
│   │   ├── CarbonCredits.tsx
│   │   ├── Login.tsx
│   │   └── ui/              # Reusable UI components
│   ├── lib/
│   │   ├── firebase.ts      # Firebase configuration
│   │   └── navigation.ts    # URL-based navigation
│   └── services/
│       ├── api.ts           # Centralized API client
│       └── logoGenerator.ts # Logo generation service
├── public/                  # Static assets
├── index.html              # HTML entry point
├── package.json            # Dependencies & scripts
├── vite.config.ts          # Vite configuration
├── tsconfig.json           # TypeScript configuration
├── .env.local              # Local environment variables
├── .env                    # Production environment variables
└── README.md               # This file

```

---

## 🔌 API Endpoints

### Health Check
- `GET /api/health` - Check if backend is running

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout
- `POST /api/auth/verify-token` - Verify JWT token

### Restaurants
- `GET /api/restaurants` - Get all restaurants
- `POST /api/restaurants` - Create new restaurant
- `POST /api/restaurants/:id/food-listings` - Add food listing

### NGOs
- `GET /api/ngos` - Get all NGOs
- `POST /api/ngos` - Create new NGO
- `POST /api/ngos/:id/requests` - Submit food request

### Deliveries
- `GET /api/deliveries/:id` - Get delivery status
- `POST /api/deliveries` - Create delivery

### Payments (Razorpay)
- `POST /api/payments/create-order` - Create payment order
- `POST /api/payments/verify` - Verify payment

### Carbon Credits
- `GET /api/carbon/credits/:userId` - Get carbon credits
- `POST /api/carbon/calculate` - Calculate carbon savings

### Notifications
- `POST /api/notifications/send-email` - Send email notification
- `POST /api/notifications/send-telegram` - Send Telegram notification

### Analytics
- `GET /api/analytics/impact` - Get platform impact metrics

---

## 🔧 Configuration

### Environment Variables

| Variable | Purpose | Default |
|----------|---------|---------|
| `NODE_ENV` | Environment mode | `development` |
| `PORT` | Backend port | `5000` |
| `VITE_API_BASE_URL` | API base URL | `http://localhost:5000/api` |
| `CORS_ORIGINS` | Allowed CORS origins | `localhost:5173,localhost:5000` |
| `VITE_FIREBASE_API_KEY` | Firebase API key | Required |
| `VITE_EMAILJS_SERVICE_ID` | EmailJS service | Optional |
| `TELEGRAM_BOT_TOKEN` | Telegram bot token | Optional |
| `VITE_RAZORPAY_KEY_ID` | Razorpay public key | Optional |

---

## 🏗️ Building for Production

### 1. Build Frontend Bundle
```bash
npm run build
```

This creates optimized production build in `dist/` folder.

### 2. Production Build Output
```
dist/
├── index.html
├── assets/
│   ├── main-xxxxx.js       # Main bundle
│   ├── vendor-xxxxx.js     # Vendor libraries
│   ├── firebase-xxxxx.js   # Firebase chunk
│   └── *.css               # Stylesheets
└── logo.svg
```

### 3. Test Production Build Locally
```bash
npm run build
npm run preview
```

Opens http://localhost:4173 with production build.

---

## 🚀 Deployment

### Vercel Deployment (Recommended)

**Step 1: Install Vercel CLI**
```bash
npm install -g vercel
```

**Step 2: Deploy**
```bash
vercel --prod
```

**Step 3: Configure Environment Variables in Vercel Dashboard**
- Go to Project Settings → Environment Variables
- Add all variables from `.env`

**Step 4: Update API Base URL**
```env
VITE_API_BASE_URL=https://your-vercel-project.vercel.app/api
```

### Docker Deployment

Create `Dockerfile`:
```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN npm run build
EXPOSE 5000
CMD ["npm", "start"]
```

Build and run:
```bash
docker build -t ecoserve .
docker run -p 5000:5000 ecoserve
```

### Self-Hosted (VPS/Dedicated Server)

1. **SSH into your server**
```bash
ssh user@your-server.com
```

2. **Install Node.js & npm**
```bash
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs
```

3. **Clone repository**
```bash
git clone your-repo.git
cd vega
```

4. **Install dependencies**
```bash
npm install --production
npm run build
```

5. **Set up PM2 for process management**
```bash
sudo npm install -g pm2
pm2 start server.js --name "ecoserve"
pm2 startup
pm2 save
```

6. **Configure Nginx as reverse proxy**
```nginx
server {
    listen 80;
    server_name ecoserve.platform;
    
    location / {
        proxy_pass http://localhost:5000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

---

## 🐛 Troubleshooting

### Issue: Port Already in Use
```bash
# Windows - Kill process on port 5000
netstat -ano | findstr :5000
taskkill /PID xxxx /F

# macOS/Linux
lsof -i :5000
kill -9 <PID>
```

### Issue: CORS Errors
1. Ensure backend is running: `npm run dev:backend`
2. Check `CORS_ORIGINS` in `.env.local`
3. Restart both frontend and backend

### Issue: Firebase Not Connecting
1. Verify Firebase keys in `.env.local`
2. Check Firebase project settings
3. Ensure Firestore is enabled in Firebase console

### Issue: API Requests Failing
1. Check backend health: `curl http://localhost:5000/api/health`
2. Verify `VITE_API_BASE_URL` points to correct backend
3. Check browser console for errors (F12)
4. Check server logs in terminal

### Issue: Build Fails
```bash
# Clear cache and reinstall
rm -rf node_modules dist
npm cache clean --force
npm install
npm run build
```

---

## 📊 Performance Optimization

### Frontend
- Code splitting: Separate vendor, Firebase, animations chunks
- Lazy loading: Route-based code splitting
- Image optimization: Use WebP with fallbacks
- Compression: gzip enabled on all responses

### Backend
- Response compression: gzip for all JSON responses
- CORS optimization: Specific allowed origins
- Request logging: Development only
- Error handling: Graceful error responses

---

## 🔐 Security Best Practices

### Implemented
- ✅ Environment variable protection
- ✅ CORS headers configured
- ✅ Firebase security rules
- ✅ Credential mode: include

### Recommended Additional Steps
1. **SSL/TLS**: Use HTTPS in production
2. **Rate Limiting**: Add express-rate-limit
3. **Input Validation**: Validate all user inputs
4. **Password Hashing**: Use bcrypt for passwords
5. **JWT Tokens**: Implement token-based auth
6. **Database Backups**: Regular Firestore backups
7. **Monitoring**: Set up error tracking (Sentry)

---

## 📝 Scripts Reference

```bash
# Development
npm run dev              # Start both frontend + backend
npm run dev:frontend    # Frontend only
npm run dev:backend     # Backend only

# Building
npm run build           # Build production bundle
npm run preview         # Preview production build locally

# Validation
npm run lint           # TypeScript type checking
npm run type-check     # Full type checking

# Deployment
npm run deploy         # Deploy to Vercel
npm run start          # Start production server
npm run prod           # Build and start production
```

---

## 🎨 Customization

### Change Brand Colors
Edit `src/index.css`:
```css
@theme {
  --color-eco-primary: #6A9634;
  --color-eco-soft-green: #B8D08A;
  /* ... */
}
```

### Update Navigation Items
Edit `src/App.tsx` - `navItems` array

### Add New Dashboard Page
1. Create component in `src/components/`
2. Add to `App.tsx` imports
3. Add menu item to `navItems`
4. Add route handling to `App.tsx`

---

## 📞 Support & Resources

- **Firebase Docs**: https://firebase.google.com/docs
- **React Docs**: https://react.dev
- **Vite Docs**: https://vitejs.dev
- **Tailwind CSS**: https://tailwindcss.com
- **Express.js**: https://expressjs.com

---

## 📄 License

EcoServe Platform © 2024. All rights reserved.

---

**Last Updated**: May 2024
**Version**: 1.0.0
