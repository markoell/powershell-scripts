# Stackit / CloudFoundry functions
function Start-Dockers {
    Push-Location .\src\shared\docker;
    & docker-compose -p "lidl-travel-services" up -d --build;
    Pop-Location
}

function Stop-Dockers {
    Push-Location .\src\shared\docker;
    & docker-compose down;
    Pop-Location
}