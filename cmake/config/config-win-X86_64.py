import subprocess

# be sure to run "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64 before

subprocess.check_call(["cmake", "..",
                       "-G", "Ninja",
                       "-DCMAKE_BUILD_TYPE=Release",
                       "-DCMAKE_CROSSCOMPILING=FALSE",
                       "-DQBDI_PLATFORM=windows",
                       "-DQBDI_ARCH=X86_64"])
