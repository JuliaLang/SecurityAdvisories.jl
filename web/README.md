# Julia Security Advisories — Website

Static website for browsing the Julia Security Advisory Database, built with [Franklin.jl](https://github.com/tlienart/Franklin.jl).

## Local Development

```sh
cd web
julia --project -e 'using Franklin; serve()'
```

For faster iteration during development, set `FRANKLIN_DEV` to limit page generation:

```sh
FRANKLIN_DEV=1 julia --project -e 'using Franklin; serve()'
```

By default dev mode generates only 10 advisory pages. Override with `FRANKLIN_DEV_LIMIT`:

```sh
FRANKLIN_DEV=1 FRANKLIN_DEV_LIMIT=25 julia --project -e 'using Franklin; serve()'
```

## Full Build

```sh
cd web
julia --project -e 'using Franklin; optimize()'
```

Auto-generated `advisories/JLSEC-*/` and `packages/*/` directories are created at build time by `hfun_generate_advisory_pages` in `utils.jl` and are git-ignored.
