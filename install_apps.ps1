#Install New apps
#first, start powershell, and then run this command:
#Start-Process powershell -Verb runAs

#second, allow temporarily script execution by executing this command:
#Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process

#third, navigate to the directory where the scrip lives

#fourth, execute the script like this:
#powershell -noexit "& "".\install_apps.ps1"""


    $apps = @(
        @{name = "Microsoft.Teams" }, 
        @{name = "Google.Chrome" }, 
        @{name = "Google.Drive" }, 
        @{name = "vscodium" }, 
        @{name = "ProjectJupyter.JupyterLab" }, 
        @{name = "Git.Git" }, 
        @{name = "GitHub.GitHubDesktop" },
        @{name = "JGraph.Draw" },
        @{name = "Dropbox.Dropbox" },
        @{name = "VideoLAN.VLC" },
        @{name = "Foxit.FoxitReader" },
        @{name = "Oracle.JavaRuntimeEnvironment" },
        @{name = "thunderbird" },
        @{name = "Telegram.TelegramDesktop" },
        @{name = "Notepad++.Notepad++" },
        @{name = "7zip.7zip" },
        @{name = "reMarkable.reMarkableCompanionApp" },
        @{name = "AppWork.JDownloader" },
        @{name = "Adobe.Acrobat.Reader.64-bit" }
    );

    #Apps that require interaction during install
    $iapps = @(
        @{name = "Anaconda.Anaconda3" }
    );
    Foreach ($app in $apps) {
        #check if the app is already installed
        $listApp = winget list --exact -q $app.name
        if (![String]::Join("", $listApp).Contains($app.name)) {
            Write-host "Installing:" $app.name
            if ($app.source -ne $null) {
                winget install --exact --silent $app.name --source $app.source --accept-package-agreements
            }
            else {
                winget install --exact --silent $app.name --accept-package-agreements 
            }
        }
        else {
            Write-host "Skipping Install of " $app.name
        }
    }
    Foreach ($app in $iapps) {
        #check if the app is already installed
        $listApp = winget list --exact -q $app.name
        if (![String]::Join("", $listApp).Contains($app.name)) {
            Write-host "Installing:" $app.name
            if ($app.source -ne $null) {
                winget install --exact --interactive $app.name --source $app.source --accept-package-agreements
            }
            else {
                winget install --exact --interactive $app.name --accept-package-agreements 
            }
        }
        else {
            Write-host "Skipping Install of " $app.name
        }
    }
