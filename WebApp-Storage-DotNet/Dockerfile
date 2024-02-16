# Use the official .NET Core SDK image as a build environment
FROM mcr.microsoft.com/dotnet/framework/sdk:6.0 AS build
WORKDIR /app

# Copy the project file and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the remaining source code
COPY . ./

# Build the application
RUN dotnet publish -c Release -o out

# Use the official .NET Core Runtime image as the runtime environment
FROM mcr.microsoft.com/dotnet/framework/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .

# Expose port 80 to the outside world
EXPOSE 80

# Command to run the application
ENTRYPOINT ["dotnet", "WebApp-Storage-DotNet.dll"]
