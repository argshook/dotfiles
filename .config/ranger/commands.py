import os
from ranger.api.commands import Command


# fzf_fasd - Fasd + Fzf + Ranger (Interactive Style)
class fzf_fasd(Command):
    """
    :fzf_fasd

    Jump to a file or folder using Fasd and fzf

    URL: https://github.com/clvv/fasd
    URL: https://github.com/junegunn/fzf
    """

    def execute(self):
        import subprocess
        cwd = self.fm.thisfile.dirname
        command = "fasd | fzf -i --tac --no-sort --bind \"ctrl-w:backward-kill-word\" -q %s | awk '{print $2}'" % (
            cwd)

        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)


# Fasd with ranger (Command Line Style)
# https://github.com/ranger/ranger/wiki/Commands
class fasd(Command):
    """
    :fasd

    Jump to directory using fasd
    URL: https://github.com/clvv/fasd
    """

    def execute(self):
        import subprocess
        arg = self.rest(1)
        if arg:
            directory = subprocess.check_output(
                ["fasd", "-d"]+arg.split(), universal_newlines=True).strip()
            self.fm.cd(directory)
