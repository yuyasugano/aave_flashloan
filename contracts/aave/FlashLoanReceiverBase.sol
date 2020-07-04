// Original: https://github.com/aave/aave-protocol/blob/master/contracts/flashloan/base/FlashLoanReceiverBase.sol
pragma solidity ^0.5.0;

import "./SafeMath.sol";
import "./IERC20.sol";
import "./SafeERC20.sol";
import "./IFlashLoanReceiver.sol";
import "./ILendingPoolAddressesProvider.sol";
import "./EthAddressLib.sol";

contract FlashLoanReceiverBase is IFlashLoanReceiver {

    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    // TODO: Set here the address of the Aave protocol addresses provider.
    // See https://developers.aave.com/#the-lendingpooladdressesprovider. This address should not change once deployed.
    ILendingPoolAddressesProvider public constant addressesProvider = ILendingPoolAddressesProvider(address(0x1c8756FD2B28e9426CDBDcC7E3c4d64fa9A54728));

    function () external payable { }

    function transferFundsBackToPoolInternal(address _reserve, uint256 _amount) internal {
        address payable core = addressesProvider.getLendingPoolCore();
        transferInternal(core, _reserve, _amount);
    }

    function transferInternal(address payable _destination, address _reserve, uint256 _amount) internal {
        if(_reserve == EthAddressLib.ethAddress()) {
            //solium-disable-next-line
            _destination.call.value(_amount)("");
            return;
        }
        IERC20(_reserve).safeTransfer(_destination, _amount);
    }

    function getBalanceInternal(address _target, address _reserve) internal view returns(uint256) {
        if(_reserve == EthAddressLib.ethAddress()) {
            return _target.balance;
        }
        return IERC20(_reserve).balanceOf(_target);
    }
}
