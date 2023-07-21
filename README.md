# winget_batch_install
A simple powershell batch file to install multiple apps. Automatically skips already installed apps.
There are two lists available that both contain app identifiers that you can easily google with `winget APPNAME`.
The first list `apps` should only contain apps that can be installed silently, i.e. without interaction.
The second list `iapps` should contain the apps that require some interaction beyond merely accepting some agreement.

## How to
1. Start powershell, and then run this command:
```
Start-Process powershell -Verb runAs
```

2. Allow temporarily script execution by executing this command:
```
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
```

3. Navigate to the directory where the scrip lives

4. Execute the script like this:
```
powershell -noexit "& "".\install_apps.ps1"""
```

