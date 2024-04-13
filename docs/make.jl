using Documenter, QDash

makedocs(
    modules = [QDash],
    format = if "pdf" in ARGS
        Documenter.LaTeX(platform = "docker")
    else
        Documenter.HTML(
            # Use clean URLs, unless built as a "local" build
            prettyurls = !("local" in ARGS),
            analytics = "UA-136089579-2",
            highlights = ["yaml"],
            ansicolor = true,
            inventory_version = Documenter.DOCUMENTER_VERSION,
        )
    end,
    build = ("pdf" in ARGS) ? "build-pdf" : "build",
    debug = ("pdf" in ARGS),
    sitename = "QDash.jl",
    authors = "Tongyu Zhao",
    linkcheck = "linkcheck" in ARGS,
    linkcheck_ignore = [
        # We'll ignore links that point to GitHub's edit pages, as they redirect to the
        # login screen and cause a warning:
        r"https://github.com/([A-Za-z0-9_.-]+)/([A-Za-z0-9_.-]+)/edit(.*)",
        "https://nvd.nist.gov/vuln/detail/CVE-2018-16487",
    ] ∪ (get(ENV, "GITHUB_ACTIONS", nothing)  == "true" ? [
        # Extra ones we ignore only on CI.
        #
        # It seems that CTAN blocks GitHub Actions?
        "https://ctan.org/pkg/minted",
    ] : []),
    pages = [
        "Home" => "index.md",
        # "Manual" => Any[
        #     "Guide" => "man/guide.md",
        #     "man/examples.md",
        #     "man/syntax.md",
        #     "man/doctests.md",
        #     "man/latex.md",
        #     hide("man/hosting.md", [
        #         "man/hosting/walkthrough.md"
        #     ]),
        #     "man/other-formats.md",
        # ],
        # "showcase.md",
        # "Reference" => Any[
        #     "Public API" => "lib/public.md",
        #     "lib/remote-links.md",
        #     "Semantic versioning" => "lib/semver.md",
        # ],
        # "Developers" => [
        #     "contributing.md",
        #     "checklists.md",
        #     "Internals" => map(
        #         s -> "lib/internals/$(s)",
        #         sort(readdir(joinpath(@__DIR__, "src/lib/internals")))
        #     ),
        # ],
        # "release-notes.md",
    ],
    warnonly = ("strict=false" in ARGS),
    doctest = ("doctest=only" in ARGS) ? :only : true,
)

deploydocs(; repo="github.com/ty-zhao/QDash.jl.git")