# Stackit / CloudFoundry functions
function Start-Dockers {
    Push-Location .\src\shared\docker;
    & docker-compose up -d;
    Pop-Location
}

function Stop-Dockers {
    Push-Location .\src\shared\docker;
    & docker-compose down;
    Pop-Location
}