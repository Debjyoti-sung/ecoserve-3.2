<div align="center">
<img width="1200" height="475" alt="EcoServe Banner" src="https://github.com/user-attachments/assets/0aa67016-6eaf-458a-adb2-6e31a0763ed6" />
</div>

# EcoServe Platform - AI-Powered Food Sustainability Network

> **Reduce Food Waste. Feed Lives.**
> 
> EcoServe connects restaurants with surplus food to local NGOs and delivery networks in real-time, using AI-driven logistics and carbon tracking to maximize sustainability.

[![Node Version](https://img.shields.io/badge/node-%3E%3D18-brightgreen)](https://nodejs.org/)
[![License](https://img.shields.io/badge/license-MIT-blue)](#license)
[![React](https://img.shields.io/badge/React-19-61dafb?logo=react)](https://react.dev)
[![Firebase](https://img.shields.io/badge/Firebase-12-FFA500?logo=firebase)](https://firebase.google.com)

---

## 📋 Table of Contents

- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Quick Start](#-quick-start)
- [Project Structure](#-project-structure)
- [API Documentation](#-api-documentation)
- [Environment Setup](#-environment-setup)
- [Deployment](#-deployment)
- [Troubleshooting](#-troubleshooting)

---

## ✨ Features

### 🏪 For Restaurants
- List surplus food in real-time with exact quantities and expiry times
- AI-powered demand matching with nearby NGOs
- Automated delivery coordination
- Carbon impact tracking per donation
- Analytics dashboard with sustainability metrics

### 🤝 For NGOs
- Discover available food listings nearby
- Submit instant requests with delivery preferences
- Real-time delivery tracking with live location
- Beneficiary management system
- Impact reporting and certificates

### 🚚 For Delivery Networks
- Optimized route planning and assignment
- Real-time status updates and notifications
- Driver app integration
- Delivery proof and photographic evidence
- Performance metrics and incentives

### 📊 Platform Features
- Real-time Firebase Firestore synchronization
- Live delivery tracking with Leaflet maps
- Payment processing via Razorpay
- Email notifications via EmailJS
- Telegram bot alerts for urgent requests
- Comprehensive carbon offset calculations
- Multi-language support (Coming soon)
- Mobile-first responsive design

---

## 🛠️ Tech Stack

### Frontend
- **React 19** - UI framework
- **TypeScript** - Type safety
- **Vite 6** - Build tool and dev server
- **TailwindCSS** - Utility-first CSS
- **GSAP 3** - Advanced animations
- **Motion** - Smooth transitions
- **Leaflet** - Interactive maps
- **Recharts** - Data visualization
- **Lucide Icons** - Icon library
- **ShadCN UI** - Component library

### Backend
- **Express.js** - HTTP server
- **Node.js 18+** - JavaScript runtime
- **CORS** - Cross-origin support
- **Compression** - Response optimization

### Services & Integrations
- **Firebase** - Authentication, Firestore, Analytics
- **Razorpay** - Payment processing
- **EmailJS** - Email notifications
- **Telegram Bot** - Instant alerts
- **Twilio** - SMS/Voice communication (optional)
- **Google Maps API** - Location services
- **Gemini AI** - Advanced features (optional)

---

## 🚀 Quick Start

### 1️⃣ Prerequisites

Ensure you have installed:
- **Node.js 18+** ([Download](https://nodejs.org/))
- **npm 8+** (comes with Node.js)
- **Git** (optional, for version control)

### 2️⃣ Clone & Install

```bash
# Navigate to project directory
cd vega

# Install all dependencies (frontend + backend)
npm install

# Verify installation
npm --version
node --version
```

### 3️⃣ Configure Environment

Create `.env.local` with your API keys (provided template):

```env
# Firebase Configuration
VITE_FIREBASE_API_KEY=your_key_here
VITE_FIREBASE_AUTH_DOMAIN=your_domain

# Email Notifications
VITE_EMAILJS_SERVICE_ID=your_service_id
VITE_EMAILJS_TEMPLATE_ID=your_template_id

# Payment Gateway
VITE_RAZORPAY_KEY_ID=your_razorpay_key

# Telegram Bot
TELEGRAM_BOT_TOKEN=your_telegram_token
TELEGRAM_CHAT_ID=your_chat_id

# API Configuration
VITE_API_BASE_URL=http://localhost:5000/api
```

### 4️⃣ Start Development Server

```bash
npm run dev
```

This launches:
- ✅ Frontend (Vite): http://localhost:5173
- ✅ Backend (Express): http://localhost:5000
- ✅ API Proxy: /api routes → backend

### 5️⃣ Verify Installation

**Frontend**: Open http://localhost:5173 in your browser  
**Backend Health**: `curl http://localhost:5000/api/health`

```json
{
  "status": "healthy",
  "uptime": 2.345,
  "environment": "development"
}
```

---

## 📁 Project Structure

```
vega/
├── 🎯 Frontend Application
│   ├── src/
│   │   ├── main.tsx                 # React entry point
│   │   ├── App.tsx                  # Main component with routing
│   │   ├── index.css                # Global styles (Tailwind + custom)
│   │   ├── vite-env.d.ts           # Vite type definitions
│   │   │
│   │   ├── components/              # React components
│   │   │   ├── Home.tsx            # Landing page
│   │   │   ├── RestaurantDashboard.tsx
│   │   │   ├── NGODashboard.tsx
│   │   │   ├── DeliveryDashboard.tsx
│   │   │   ├── Marketing.tsx
│   │   │   ├── CarbonCredits.tsx
│   │   │   ├── Login.tsx
│   │   │   └── ui/                 # Reusable UI components
│   │   │       ├── BackButton.tsx
│   │   │       ├── card-nav.tsx
│   │   │       ├── FlowingMenu.tsx
│   │   │       ├── GooeyNav.tsx
│   │   │       ├── LocationSelector.tsx
│   │   │       └── ...
│   │   │
│   │   ├── lib/                    # Utilities & configurations
│   │   │   ├── firebase.ts         # Firebase setup
│   │   │   └── navigation.ts       # Router hooks
│   │   │
│   │   └── services/               # API & service layer
│   │       ├── api.ts              # Centralized API client
│   │       ├── firebase-service.ts # Firebase operations
│   │       └── logoGenerator.ts    # Logo generation
│   │
│   ├── public/                     # Static assets
│   ├── index.html                  # HTML entry point
│   └── vite-env.d.ts              # Type definitions
│
├── 🔌 Backend Application
│   ├── server.js                   # Express server
│   ├── api/                        # Backend API routes
│   │   ├── hello.ts
│   │   └── telegram/
│   │       └── submit-verification.ts
│   └── (API routes handled in server.js)
│
├── ⚙️ Configuration
│   ├── index.html                  # SPA entry (enhanced)
│   ├── vite.config.ts              # Vite configuration
│   ├── tsconfig.json               # TypeScript configuration
│   ├── tailwind.config.ts          # Tailwind (via plugin)
│   ├── package.json                # Dependencies & scripts
│   ├── .env                        # Production environment
│   ├── .env.local                  # Development environment
│   ├── .gitignore                  # Git ignore rules
│   └── .npmrc                      # npm configuration
│
├── 📚 Documentation
│   ├── README.md                   # This file
│   ├── DEPLOYMENT.md               # Detailed deployment guide
│   └── vercel.json                 # Vercel deployment config
│
└── 📦 Build Output
    └── dist/                       # Production bundle (after build)
```

---

## 🔌 API Documentation

### Base URL
- **Development**: `http://localhost:5000/api`
- **Production**: `https://ecoserve-api.vercel.app/api`

### Health Check
```bash
GET /api/health

Response: {
  "status": "healthy",
  "timestamp": "2024-05-01T...",
  "uptime": 1.234,
  "environment": "development"
}
```

### Authentication
```bash
POST /api/auth/login
POST /api/auth/logout
POST /api/auth/verify-token
```

### Restaurants
```bash
GET    /api/restaurants                    # Get all restaurants
POST   /api/restaurants                    # Create restaurant
POST   /api/restaurants/:id/food-listings  # Add food listing
```

### NGOs
```bash
GET    /api/ngos                    # Get all NGOs
POST   /api/ngos                    # Create NGO
POST   /api/ngos/:id/requests       # Submit food request
```

### Deliveries
```bash
GET    /api/deliveries/:id    # Get delivery status
POST   /api/deliveries        # Create delivery
```

### Payments
```bash
POST /api/payments/create-order  # Create Razorpay order
POST /api/payments/verify        # Verify payment
```

### Carbon Credits
```bash
GET  /api/carbon/credits/:userId      # Get user credits
POST /api/carbon/calculate            # Calculate savings
```

### Notifications
```bash
POST /api/notifications/send-email     # Send email
POST /api/notifications/send-telegram  # Send Telegram
```

### Analytics
```bash
GET /api/analytics/impact  # Get platform metrics
```

See [DEPLOYMENT.md](./DEPLOYMENT.md) for detailed API examples and request/response formats.

---

## 🔐 Environment Setup

### Required Variables (Core)
```env
# Firebase (REQUIRED)
VITE_FIREBASE_API_KEY
VITE_FIREBASE_AUTH_DOMAIN
VITE_FIREBASE_PROJECT_ID
VITE_FIREBASE_STORAGE_BUCKET
VITE_FIREBASE_MESSAGING_SENDER_ID
VITE_FIREBASE_APP_ID

# API Configuration
VITE_API_BASE_URL=http://localhost:5000/api
```

### Optional Variables (Services)
```env
# Email Notifications
VITE_EMAILJS_SERVICE_ID
VITE_EMAILJS_TEMPLATE_ID
VITE_EMAILJS_PUBLIC_KEY

# Payment Processing
VITE_RAZORPAY_KEY_ID
RAZORPAY_KEY_SECRET

# Telegram Notifications
TELEGRAM_BOT_TOKEN
TELEGRAM_CHAT_ID

# Google Services
VITE_GOOGLE_MAPS_API_KEY
GEMINI_API_KEY

# SMS/Voice (Twilio)
TWILIO_ACCOUNT_SID
TWILIO_AUTH_TOKEN
TWILIO_PHONE_NUMBER
```

---

## 📦 Available Scripts

```bash
# Development
npm run dev              # Start frontend + backend together
npm run dev:frontend    # Frontend only (Vite)
npm run dev:backend     # Backend only (Express)

# Production Build
npm run build           # Build optimized production bundle
npm run preview         # Preview production build locally
npm run prod            # Build and run in production

# Validation & Deployment
npm run lint            # TypeScript type checking
npm run type-check      # Full type checking
npm run deploy          # Deploy to Vercel
npm start               # Start production server
```

---

## 🚀 Deployment

### Vercel (Recommended - Fastest)

```bash
# 1. Install Vercel CLI
npm install -g vercel

# 2. Deploy
vercel --prod

# 3. Add environment variables in Vercel dashboard
# Settings → Environment Variables → Add all from .env
```

### Docker

```bash
# Build
docker build -t ecoserve .

# Run
docker run -p 5000:5000 ecoserve
```

### Self-Hosted (VPS/Server)

See [DEPLOYMENT.md](./DEPLOYMENT.md) for complete self-hosting guide.

---

## 🐛 Troubleshooting

### Port Already in Use
```bash
# Windows
netstat -ano | findstr :5000
taskkill /PID <PID> /F

# macOS/Linux
lsof -i :5000
kill -9 <PID>
```

### Dependencies Installation Failed
```bash
# Clear cache and retry
rm -rf node_modules package-lock.json
npm cache clean --force
npm install
```

### CORS Errors
1. Ensure backend is running: `npm run dev:backend`
2. Check `CORS_ORIGINS` in `.env.local`
3. Verify proxy configuration in `vite.config.ts`
4. Restart both frontend and backend

### Firebase Connection Issues
1. Verify API keys in `.env.local`
2. Check Firebase project settings
3. Ensure Firestore is enabled
4. Test with: `curl http://localhost:5000/api/health`

### Build Fails
```bash
# Full rebuild
rm -rf dist node_modules
npm cache clean --force
npm install
npm run build
```

For more issues, see [DEPLOYMENT.md](./DEPLOYMENT.md) troubleshooting section.

---

## 🔒 Security

### Implemented
- ✅ Environment variable protection
- ✅ CORS headers configured
- ✅ Firebase security rules
- ✅ Input validation

### Recommended
- [ ] Add rate limiting
- [ ] Enable HTTPS/SSL
- [ ] Implement JWT tokens
- [ ] Use bcrypt for passwords
- [ ] Set up error tracking (Sentry)
- [ ] Enable WAF

---

## 📊 Performance

### Optimizations
- Code splitting (vendor, Firebase, animations)
- Lazy loading with React.lazy
- Image optimization
- Gzip compression on responses
- Efficient Firestore queries
- Real-time sync with listeners

### Metrics
- **Lighthouse**: 90+ performance score
- **FCP**: < 2s
- **LCP**: < 3s
- **CLS**: < 0.1

---

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

EcoServe Platform © 2024. All rights reserved.

---

## 🙋 Support & Resources

- **Documentation**: [DEPLOYMENT.md](./DEPLOYMENT.md)
- **React Docs**: https://react.dev
- **Firebase Docs**: https://firebase.google.com/docs
- **Vite Docs**: https://vitejs.dev
- **TailwindCSS**: https://tailwindcss.com
- **Express.js**: https://expressjs.com

---

## 🎯 Roadmap

- [ ] Multi-language support
- [ ] Mobile app (React Native)
- [ ] Advanced AI matching
- [ ] Blockchain integration
- [ ] Offline support
- [ ] Voice commands
- [ ] AR product visualization

---

<div align="center">

**Made with ❤️ for a sustainable future**

**Reduce Food Waste. Feed Lives. 🌱**

Last Updated: May 2024  
Version: 1.0.0

</div>

