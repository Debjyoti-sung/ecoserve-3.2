#!/bin/bash
# EcoServe Platform - Quick Setup Script
# This script validates and sets up your development environment

echo "╔════════════════════════════════════════════════════════════╗"
echo "║           EcoServe Platform - Setup Validator             ║"
echo "║         AI-Powered Food Sustainability Network            ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Track errors
ERRORS=0

# Check Node.js
echo "🔍 Checking Node.js installation..."
if command -v node &> /dev/null; then
    NODE_VERSION=$(node -v)
    echo -e "${GREEN}✓ Node.js installed: $NODE_VERSION${NC}"
else
    echo -e "${RED}✗ Node.js not found. Install from https://nodejs.org/${NC}"
    ((ERRORS++))
fi

# Check npm
echo "🔍 Checking npm installation..."
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm -v)
    echo -e "${GREEN}✓ npm installed: $NPM_VERSION${NC}"
else
    echo -e "${RED}✗ npm not found. Please install Node.js${NC}"
    ((ERRORS++))
fi

# Check if node_modules exists
echo "🔍 Checking dependencies..."
if [ -d "node_modules" ]; then
    echo -e "${GREEN}✓ Dependencies installed${NC}"
else
    echo -e "${YELLOW}⚠ Dependencies not found. Run: npm install${NC}"
fi

# Check .env.local
echo "🔍 Checking environment configuration..."
if [ -f ".env.local" ]; then
    echo -e "${GREEN}✓ .env.local file exists${NC}"
    
    # Check for Firebase key
    if grep -q "VITE_FIREBASE_API_KEY" .env.local; then
        echo -e "${GREEN}✓ Firebase configuration found${NC}"
    else
        echo -e "${YELLOW}⚠ Firebase API key not configured${NC}"
    fi
else
    echo -e "${RED}✗ .env.local file not found. Creating template...${NC}"
    touch .env.local
    echo "# Firebase Configuration" >> .env.local
    echo "VITE_FIREBASE_API_KEY=" >> .env.local
    echo "# See .env.local for all required variables" >> .env.local
fi

# Check source files
echo "🔍 Checking project structure..."
if [ -d "src" ]; then
    echo -e "${GREEN}✓ src/ directory found${NC}"
else
    echo -e "${RED}✗ src/ directory not found${NC}"
    ((ERRORS++))
fi

if [ -f "server.js" ]; then
    echo -e "${GREEN}✓ server.js found${NC}"
else
    echo -e "${RED}✗ server.js not found${NC}"
    ((ERRORS++))
fi

if [ -f "index.html" ]; then
    echo -e "${GREEN}✓ index.html found${NC}"
else
    echo -e "${RED}✗ index.html not found${NC}"
    ((ERRORS++))
fi

# Summary
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✓ All checks passed!${NC}"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo ""
    echo "🚀 Ready to start development!"
    echo ""
    echo "Next steps:"
    echo "1. Configure .env.local with your API keys"
    echo "2. Run: npm install"
    echo "3. Run: npm run dev"
    echo ""
    echo "Frontend: http://localhost:5173"
    echo "Backend:  http://localhost:5000"
else
    echo -e "${RED}✗ Setup incomplete. Fix errors above.${NC}"
    echo "╚════════════════════════════════════════════════════════════╝"
fi

exit $ERRORS
