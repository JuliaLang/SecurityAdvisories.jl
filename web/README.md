# Julia Security Advisories — Website

Static website for browsing the Julia Security Advisory Database, built with [Franklin.jl](https://github.com/tlienart/Franklin.jl).

## Development

```sh
cd web
julia --project=. pre_generate.jl
julia --project=. -e 'using Franklin; serve()'
```

Limit pages for faster iteration: `FRANKLIN_DEV_LIMIT=10 julia --project=. pre_generate.jl`

## Production

```sh
cd web
julia --project=. pre_generate.jl
julia --project=. -e 'using Franklin; optimize()'
```

`pre_generate.jl` creates advisory/package `.md` pages before Franklin runs so all pages are processed in a single pass.
