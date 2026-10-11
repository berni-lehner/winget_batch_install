#Install New apps
#first, start powershell, and then run this command:
#Start-Process powershell -Verb runAs

#second, allow temporarily script execution by executing this command:
#Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process

#third, navigate to the directory where the scrip lives

#fourth, execute the script like this:
#.\install_apps.ps1


    #Set interactive = $true for apps that require interaction during install
    $apps = @(
        @{name = "Microsoft.Teams" },
        @{name = "Google.Chrome" },
        @{name = "Google.GoogleDrive" },
        @{name = "VSCodium.VSCodium" },
        @{name = "Git.Git" },
        @{name = "GitHub.GitHubDesktop" },
        @{name = "Dropbox.Dropbox" },
        @{name = "VideoLAN.VLC" },
        @{name = "Foxit.FoxitReader" },
        @{name = "Oracle.JavaRuntimeEnvironment" },
        @{name = "Mozilla.Thunderbird" },
        @{name = "Notepad++.Notepad++" },
        @{name = "7zip.7zip" },
        @{name = "reMarkable.reMarkableCompanionApp" },
        @{name = "AppWork.JDownloader" },
        @{name = "Adobe.Acrobat.Reader.64-bit" },
        @{name = "Anaconda.Miniconda3"; interactive = $true }
    );

    Foreach ($app in $apps) {
        #check if the app is already installed
        $listApp = winget list --exact -q $app.name --accept-source-agreements
        if (![String]::Join("", $listApp).Contains($app.name)) {
            Write-host "Installing:" $app.name
            if ($app.interactive) {
                $mode = "--interactive"
            }
            else {
                $mode = "--silent"
            }
            if ($app.source -ne $null) {
                winget install --exact $mode $app.name --source $app.source --accept-package-agreements --accept-source-agreements
            }
            else {
                winget install --exact $mode $app.name --accept-package-agreements --accept-source-agreements
            }
        }
        else {
            Write-host "Skipping Install of " $app.name
        }
    }
