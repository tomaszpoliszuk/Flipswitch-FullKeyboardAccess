#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface FullKeyboardAccessSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSFullKeyboardAccessEnabled();
extern "C" void _AXSFullKeyboardAccessSetEnabled(BOOL);

@implementation FullKeyboardAccessSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSFullKeyboardAccessEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSFullKeyboardAccessSetEnabled(newState == FSSwitchStateOn);
}

@end
