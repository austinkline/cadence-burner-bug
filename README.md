# Cadence Burner Bug

The Burner contract does not correctly invoke resource burnCallback methods if the resource is optional.

This seems to be related to an `if let ...` clause not fully unwrapping optional resources which is a very common pattern

## Steps to reproduce

1. Install local dependencies
    ```
    npm i
    ```
2. Start flow-c1 emulator
    ```
    flow-c1 emulator
    ```
3. Deploy contracts
    ```
    flow-c1 project deploy --update
    ```
4. Run broken transaction
    ```
    flow-c1 transactions send ./transactions/burn_broken.cdc
    ```
5. Run working transaction
    ```
    flow-c1 transactions send ./transactions/burn_works.cdc
    ```
