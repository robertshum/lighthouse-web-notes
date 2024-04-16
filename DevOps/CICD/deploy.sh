echo "Stop PM2 actions"
pm2 stop "a-paint-company-api"

echo "Jump to app folder"
cd /home/ubuntu/a-paint-company

echo "update app from git"
git pull

echo "navigate to backend folder"
cd backend/

echo "install app dependencies"
sudo rm -rf node_modules package-lock.json
sudo npm install

echo "build app"
sudo npm run build

echo "run new pm2 action"
# pm2 start ./dist/app.js --name "a-paint-company-api"
sudo cp /home/ubuntu/ecosystem.json ecosystem.json
sudo pm2 start ecosystem.json




