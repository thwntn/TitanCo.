FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /App

# Copy everything
COPY TitanCo.-Back-end .
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out

# Copy environment config
COPY TitanCo.-Back-end/.env /App/out
COPY TitanCo.-Back-end/Common/Metadata/ /App/out/Metadata/

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /App
COPY --from=build-env /App/out .
ENTRYPOINT ["dotnet", "TitanCo.-Back-end.dll"]