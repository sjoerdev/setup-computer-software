# setup computer environment script

let packages = [
    # Primary Applications
    "Mozilla.Firefox",
    "Microsoft.VisualStudioCode",
    "GitHub.GitHubDesktop",
    "Discord.Discord",
    "9NKSQGP7F2NH",
    "Valve.Steam",
    "7zip.7zip",
    "VideoLAN.VLC",

    # Optional Applications
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
    "Microsoft.Edit",
    "MartiCliment.UniGetUI",
    "lostindark.DriverStoreExplorer",

    # Primary Toolchains
    "Git.Git",
    "Microsoft.DotNet.SDK.9",

    # Optional Toolchains
    "Microsoft.VCRedist.2015+.x64",
    "Microsoft.VisualStudio.2022.BuildTools",
    "Cygwin.Cygwin",
    "Microsoft.WSL",
    "Python",
    "Kitware.CMake",
    "xmake"
]

def install-packages []
{
    for pkg in $packages 
    {
        if $pkg == "Microsoft.VisualStudio.2022.BuildTools" 
        {
            ^winget install $pkg --silent --accept-package-agreements --accept-source-agreements --override "--add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --quiet"
        } 
        else 
        {
            ^winget install $pkg --silent --accept-package-agreements --accept-source-agreements
        }
    }
}

install-packages
print "Setup complete!"
