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
echo "VERSION=${VERSION}" > .env 

# Replace environtment source
cp TitanCo.-Back-end/.env.Production TitanCo.-Back-end/.env
cp TitanCo.-Front-end/.env.Production TitanCo.-Front-end/.env

# Build front end
cd TitanCo.-Front-end
npm i
npm run build
cd ..

# Copy to ngix
cp -R TitanCo.-Front-end/dist/* Build/ngix/html

# Build
docker compose -f docker-compose.yml --env-file .env up -d --build --remove-orphans

# Up to docker hub
# docker push thwntn/titanco-TitanCo.-Front-end:${VERSION}
# docker push thwntn/titanco-backend:${VERSION}
# docker push thwntn/sql-server:0.0.1