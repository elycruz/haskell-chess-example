# haskell-chess-example
Example command line chess board renderer.

## Stack info
Project structure generated with 'stack':
https://docs.haskellstack.org/en/stable/GUIDE/

## Build
To build binary:
- Run `$ stack build`
See https://docs.haskellstack.org/en/stable/GUIDE/#stack-exec

## Run
To execute built binary:
- `$ stack exec haskell-chess-example-exe`
See https://docs.haskellstack.org/en/stable/GUIDE/#stack-exec

## Test
Tests are run from 'test/Spec.hs' (using hspec-autodiscover;  
See: https://hspec.github.io/hspec-discover.html)
To run tests:
- Run `$ stack test`

## Todos
- [-] - Write tests (in progress).

## Notes
### Haskell dev environment install
#### Pain point(s)
- If installing Haskell Platform (full) (meaning with 'stack')
note that even though you may install stack in a specific directory,
stack still needs to create/use a stack root folder (for downloaded modules etc.)

## Resources:
- Chess - https://en.wikipedia.org/wiki/Chess
- Chess Rules - https://en.wikipedia.org/wiki/Chess#Rules
- Algebraic Notation - https://en.wikipedia.org/wiki/Algebraic_notation_(chess)
- hspec: http://hspec.github.io/ 
- QuickCheck: http://hackage.haskell.org/package/QuickCheck
- stack: https://docs.haskellstack.org/en/stable/README/
- haskell platform: https://www.haskell.org/downloads#platform

## LICENSE 
MIT License
