// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 6583
// Hash 4611
// Hash 3228
// Hash 5234
// Hash 7228
// Hash 3349
// Hash 3571
// Hash 1609
// Hash 6320
// Hash 6568
// Hash 8584
// Hash 7643
// Hash 2304
// Hash 3288
// Hash 7365
// Hash 4361
// Hash 5477
// Hash 6107
// Hash 2282
// Hash 8375
// Hash 5552
// Hash 6861
// Hash 1746
// Hash 5865
// Hash 6478
// Hash 3367
// Hash 4049
// Hash 1442
// Hash 4707
// Hash 5733
// Hash 7724
// Hash 4555
// Hash 5906
// Hash 8304
// Hash 7803
// Hash 4162
// Hash 7835
// Hash 7966
// Hash 9463
// Hash 1913
// Hash 2004
// Hash 7902
// Hash 7176
// Hash 1344
// Hash 7746
// Hash 8785
// Hash 5647
// Hash 2665
// Hash 1533
// Hash 1479
// Hash 7449
// Hash 6019
// Hash 2420
// Hash 1776
// Hash 8181
// Hash 6052
// Hash 4194
// Hash 8055
// Hash 6133
// Hash 1608
// Hash 9348
// Hash 9808
// Hash 3305
// Hash 3664
// Hash 6242
// Hash 4747
// Hash 7132
// Hash 5196
// Hash 8431
// Hash 1109
// Hash 2050
// Hash 4353
// Hash 6344
// Hash 5878
// Hash 3147
// Hash 9105
// Hash 3336
// Hash 5061
// Hash 6018
// Hash 5423
// Hash 3203
// Hash 3114
// Hash 1452
// Hash 5652
// Hash 7116
// Hash 8387
// Hash 1493
// Hash 6584
// Hash 3013
// Hash 9438
// Hash 3556
// Hash 4419
// Hash 3304
// Hash 5839
// Hash 6509
// Hash 1169