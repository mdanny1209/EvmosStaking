// SPDX-License-Identifier: LGPL-v3
pragma solidity >=0.8.17;

import "./Staking.sol";
import "./Distribution.sol";

contract SimpleStaker {
    /// Methods to approve when calling approve()
    string[] private stakingMethods = [MSG_DELEGATE];

    /// @dev Approves the transactions for delegation of staking rewards transactions.
    /// @dev This creates a Cosmos Authorization Grants for the given methods.
    /// @dev This emits an Approval event.
    function approve() public {
        bool success = STAKING_CONTRACT.approve(
            address(this),
            type(uint256).max,
            stakingMethods
        );
        require(success, "Failed to approve delegate method");
    }

    /// @dev stake a given amount of tokens.
    /// @dev This emits an Delegate event.
    /// @param _validatorAddr The address of the validator.
    /// @param _amount The amount of tokens to stake in aevmos.
    function stakeTokens(
        string memory _validatorAddr,
        uint256 _amount
    ) public {
        bool success = STAKING_CONTRACT.delegate(msg.sender, _validatorAddr, _amount);
        require(success, "Failed to stake tokens");
    }
}