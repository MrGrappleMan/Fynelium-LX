#!/usr/bin/env fish


# Aliases
alias rot "rpm-ostree"
function rotpkgadd -d "RPM-OSTree PKG ADD if available"
    set packages $argv
    if test (count $argv) -eq 1 -a -n (string match '* *' $argv[1])
        set packages (string split ' ' $argv[1])
    end

    set -l install_list

    for pkg in $packages
        set -l output (rpm-ostree search $pkg)
        set -l lines (string split \n -- $output)
        set -l found false

        for line in $lines
            if string match -q '* *' $line
                set -l candidate (string split -m 1 ' ' $line)[1]
                if test "$candidate" = "$pkg"
                    set found true
                    break
                end
            end
        end

        if $found
            set install_list $install_list $pkg
        end
    end

    if test (count $install_list) -gt 0
        rpm-ostree install -q --allow-inactive --idempotent -y $install_list
    end
end
alias rotpkgdel "rpm-ostree uninstall -q --allow-inactive --idempotent -y"

# PKG ADD
