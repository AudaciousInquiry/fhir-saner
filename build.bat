rd input output /s/q
call build-vars.cmd
call fetch-examples.cmd
call build-content.cmd
call build-images.cmd
rem call sushi fshx -o .
%JAVAEXE% -Xmx2G -jar ../publisher.jar -ig ig.ini %TX% %*