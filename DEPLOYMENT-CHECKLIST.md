# 🚀 EcoServe Deployment Checklist

Complete this checklist before deploying to production.

---

## ✅ Pre-Deployment Verification

### Environment Setup
- [ ] `.env.local` created with all required keys
- [ ] `.env` configured for production
- [ ] Firebase API keys validated
- [ ] All optional service keys added (Razorpay, EmailJS, Telegram)
- [ ] `VITE_API_BASE_URL` set correctly for environment

### Code Quality
- [ ] All TypeScript errors resolved: `npm run type-check`
- [ ] No console errors in browser (F12)
- [ ] No console errors in terminal
- [ ] Components render without errors
- [ ] Navigation works correctly
- [ ] All buttons functional

### Frontend Testing
- [ ] Home page loads (http://localhost:5173)
- [ ] Menu opens/closes smoothly
- [ ] Navigation buttons work
- [ ] Mobile responsive (test on mobile browser or DevTools)
- [ ] Images load correctly
- [ ] Animations play smoothly
- [ ] No layout shifts or CLS issues

### Backend Testing
- [ ] Backend running: `npm run dev:backend`
- [ ] Health check passes: `curl http://localhost:5000/api/health`
- [ ] API endpoints respond: Check Network tab in DevTools
- [ ] CORS headers configured
- [ ] Environment variables loaded
- [ ] No 500 errors in backend logs

### Firebase Testing
- [ ] Firebase connection established
- [ ] Authentication working (if implemented)
- [ ] Firestore reads/writes (verify in Firebase console)
- [ ] Real-time listeners functioning
- [ ] No auth errors in console

### Build Verification
- [ ] Production build successful: `npm run build`
- [ ] Build output in `/dist` folder
- [ ] No build warnings in output
- [ ] Build size reasonable (check bundle analysis)
- [ ] Source maps generated
- [ ] All assets included

### Production Build Testing
- [ ] Preview works: `npm run preview`
- [ ] Frontend loads on preview
- [ ] Navigation works on preview
- [ ] No errors in preview console

---

## 🔐 Security Checklist

### API Keys & Secrets
- [ ] No API keys committed to git
- [ ] `.env.local` in `.gitignore`
- [ ] Production `.env` not in repository
- [ ] Firebase admin keys secured
- [ ] Razorpay keys marked as secret
- [ ] Telegram tokens hidden

### Frontend Security
- [ ] No sensitive data in client-side code
- [ ] API requests use environment URLs
- [ ] CORS headers properly configured
- [ ] CSP headers set if applicable
- [ ] No hardcoded URLs

### Backend Security
- [ ] CORS restricted to allowed origins
- [ ] Input validation implemented
- [ ] Error messages don't expose sensitive info
- [ ] Rate limiting configured
- [ ] Request size limits set

---

## 📊 Performance Checklist

### Frontend Performance
- [ ] Lighthouse score > 80
- [ ] FCP < 2.5s
- [ ] LCP < 2.5s
- [ ] CLS < 0.1
- [ ] TTI < 3.5s
- [ ] Code splitting working

### Backend Performance
- [ ] Response time < 500ms
- [ ] Compression enabled
- [ ] Database queries optimized
- [ ] No memory leaks detected
- [ ] Load testing completed (if high-traffic expected)

### Bundle Size
- [ ] React bundle: < 50KB (gzipped)
- [ ] Firebase bundle: < 100KB (gzipped)
- [ ] Total JS: < 300KB (gzipped)
- [ ] Main CSS: < 50KB (gzipped)

---

## 🌐 Deployment Preparation

### Vercel Deployment
- [ ] Vercel CLI installed
- [ ] Project linked to Vercel
- [ ] Environment variables added in Vercel dashboard
- [ ] Build command configured: `npm run build`
- [ ] Output directory: `dist`
- [ ] Node.js version set to 18+
- [ ] Deployment preview successful

### Self-Hosted Deployment
- [ ] Server OS determined (Linux/Windows)
- [ ] Node.js installed on server
- [ ] npm packages installed
- [ ] Environment variables set
- [ ] PM2 configured (if using)
- [ ] Reverse proxy configured (nginx/Apache)
- [ ] SSL certificate installed
- [ ] Domain/DNS configured

### Docker Deployment
- [ ] Dockerfile created
- [ ] Docker image builds successfully
- [ ] Container runs without errors
- [ ] Port mapping correct
- [ ] Environment variables passed correctly
- [ ] Docker compose file configured (if needed)

---

## 🗺️ Post-Deployment Verification

### Live Monitoring
- [ ] Application loads in production URL
- [ ] Frontend renders correctly
- [ ] Backend API responding
- [ ] No 404 errors
- [ ] No CORS errors
- [ ] Database connections stable

### Functionality Testing
- [ ] All pages load
- [ ] Navigation works
- [ ] Forms submit correctly
- [ ] API calls successful
- [ ] Notifications working
- [ ] Real-time features updating

### Error Tracking
- [ ] Error monitoring enabled (Sentry/etc)
- [ ] Errors being tracked
- [ ] Alert notifications configured
- [ ] Error logs accessible

### Backup & Disaster Recovery
- [ ] Database backups scheduled
- [ ] Backup retention policy set
- [ ] Recovery plan documented
- [ ] Backup restoration tested

---

## 📈 Post-Deployment Monitoring

### Daily Checks (First Week)
- [ ] Check error logs daily
- [ ] Monitor server health
- [ ] Review user feedback
- [ ] Check performance metrics
- [ ] Monitor database usage

### Weekly Checks
- [ ] Review analytics
- [ ] Check security logs
- [ ] Monitor API performance
- [ ] Verify backups completed
- [ ] Check SSL certificate validity

### Monthly Checks
- [ ] Security audit
- [ ] Performance optimization review
- [ ] Database maintenance
- [ ] Dependency updates
- [ ] Cost analysis

---

## 🐛 Common Issues & Fixes

### Issue: Build Fails
**Fix**: 
```bash
rm -rf node_modules dist
npm cache clean --force
npm install
npm run build
```

### Issue: API Not Responding
**Fix**:
```bash
# Check backend is running
npm run dev:backend
# Verify CORS_ORIGINS in .env
# Check firewall rules
```

### Issue: CORS Errors
**Fix**:
- Ensure backend running
- Check `CORS_ORIGINS` environment variable
- Verify `vite.config.ts` proxy configuration

### Issue: Firebase Not Connecting
**Fix**:
- Verify API keys in `.env.local`
- Check Firebase project settings
- Ensure Firestore enabled
- Check security rules

---

## 📞 Support Contacts

- **Deployment Issues**: DevOps team
- **Database Issues**: Database admin
- **Security Issues**: Security team
- **Performance Issues**: Performance engineer

---

## 📝 Sign-Off

| Role | Name | Date | Signature |
|------|------|------|-----------|
| Developer | | | |
| QA | | | |
| DevOps | | | |
| Product Manager | | | |

---

**Last Updated**: May 2024  
**Version**: 1.0.0
