# Use the official .NET Core SDK image as a build environment
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

# Copy the project file and restore dependencies
COPY /home/abubakar/dotnet-app/dotnet/WebApp-Storage-DotNet/*.csproj ./
RUN dotnet restore

# Copy the remaining source code
COPY . ./

# Build the application
RUN dotnet publish -c Release -o out

# Use the official .NET Core Runtime image as the runtime environment
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build-env /app/out .

# Expose port 80 to the outside world
EXPOSE 80

# Command to run the application
ENTRYPOINT ["dotnet", "WebApp-Storage-DotNet.dll"]
