@echo off
IF EXIST staging-console (
RMDIR /S /Q .\staging-console
)

MD staging-console

SET TOOLS=.\tools
SET OUTPUTNAME=RedisReact-console.exe
SET ILMERGE=%TOOLS%\ILMerge.exe
SET RELEASE=..\..\RedisReact.AppConsole\bin\Release
SET INPUT=%RELEASE%\RedisReact.AppConsole.exe
SET INPUT=%INPUT% %RELEASE%\RedisReact.Resources.dll
SET INPUT=%INPUT% %RELEASE%\RedisReact.ServiceInterface.dll
SET INPUT=%INPUT% %RELEASE%\RedisReact.ServiceModel.dll
SET INPUT=%INPUT% %RELEASE%\ServiceStack.dll
SET INPUT=%INPUT% %RELEASE%\ServiceStack.Text.dll
SET INPUT=%INPUT% %RELEASE%\ServiceStack.Client.dll
SET INPUT=%INPUT% %RELEASE%\ServiceStack.Common.dll
SET INPUT=%INPUT% %RELEASE%\ServiceStack.Interfaces.dll
SET INPUT=%INPUT% %RELEASE%\ServiceStack.Server.dll
SET INPUT=%INPUT% %RELEASE%\ServiceStack.OrmLite.dll
SET INPUT=%INPUT% %RELEASE%\ServiceStack.Redis.dll
SET INPUT=%INPUT% %RELEASE%\ServiceStack.Razor.dll
SET INPUT=%INPUT% %RELEASE%\System.Web.Razor.dll

%ILMERGE% /target:exe /targetplatform:v4,"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.5" /out:staging-console\%OUTPUTNAME% /ndebug %INPUT% 

IF NOT EXIST apps (
MD apps
)

COPY /Y .\staging-console\%OUTPUTNAME% .\apps\

echo ------------- && echo  deployed to: .\wwwroot_build\apps\%OUTPUTNAME% && echo -------------