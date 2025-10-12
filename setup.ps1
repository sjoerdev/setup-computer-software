# setup computer enviroment script

$primaryApplications =
@(
    "Mozilla.Firefox",
    "Microsoft.VisualStudioCode",
    "GitHub.GitHubDesktop",
    "Discord.Discord",
    "9NKSQGP7F2NH", # whatsapp via msstore
    "Valve.Steam",
    "7zip.7zip",
    "VideoLAN.VLC"
)

$optionalApplications =
@(
    "Unity.UnityHub",
    "PrismLauncher.PrismLauncher",
    "qBittorrent.qBittorrent",
    "WinSCP.WinSCP",
    "Rufus.Rufus",
    "OBSProject.OBSStudio",
    "dotPDN.PaintDotNet",
    "BaldurKarlsson.RenderDoc",
    "KDE.Kdenlive",
    "WinDirStat.WinDirStat",
    "Audacity.Audacity",
    "CrystalDewWorld.CrystalDiskInfo",
    "CrystalDewWorld.CrystalDiskMark",
    "Gyan.FFmpeg",
    "ImageMagick.ImageMagick",
    "zyedidia.micro",
    "winget install Microsoft.Edit",
    "MartiCliment.UniGetUI",
    "lostindark.DriverStoreExplorer"
)

$primaryToolchains =
@(
    "Git.Git",
    "Microsoft.DotNet.SDK.9"
)

$optionalToolchains =
@(
    "Microsoft.VCRedist.2015+.x64",
    "Microsoft.VisualStudio.2022.BuildTools", # to check run: cd 'C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Tools\MSVC\14.44.35207\bin\Hostx64\x64\'; .\cl.exe
    "Cygwin.Cygwin",
    "Microsoft.WSL",
    "Python",
    "Kitware.CMake",
    "xmake"
)

function Install-Packages($packages)
{
    foreach ($name in $packages)
    {
        Write-Host "Installing $name..."
        try
        {
            if ($name -eq "Microsoft.VisualStudio.2022.BuildTools")
            {
                winget install $name --silent --accept-package-agreements --accept-source-agreements --override "--add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --quiet"
            }
            else
            {
                winget install $name --silent --accept-package-agreements --accept-source-agreements
            }
        }
        catch
        {
            Write-Host "Failed to install $name!"
        }
    }
}

Install-Packages $primaryApplications
Install-Packages $optionalApplications
Install-Packages $primaryToolchains
Install-Packages $optionalToolchains

Write-Host "Setup complete!"
