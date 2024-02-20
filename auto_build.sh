# Set version
VERSION=${1}

# Valid params
if [ -z ${VERSION} ]
then
    echo "Need run with first argument is version! Example: script.sh 0.0.1"
    exit
else
    echo "Build in version ${VERSION}"
fi
    echo "Warning: You need using same version in .env file"

# Create file environment docker build
echo "VERSION=${VERSION}" > Build/.env 

# Replace environtment source
cp Backend/.env.Production Build/Backend/.env
cp Frontend/.env.Production Build/Frontend/.env

# Build front end
cd Frontend
npm i
npm run build
cd ..

# Copy to ngix
cp -R Frontend/dist/* ngix/html

# Build
docker compose -f docker-compose.yml --env-file .env up -d --build --remove-orphans

# Up to docker hub
docker push thwntn/shared-frontend:${VERSION}
docker push thwntn/shared-backend:${VERSION}
docker push thwntn/sql-server:0.0.1