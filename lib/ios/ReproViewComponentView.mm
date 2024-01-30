#import "ReproViewComponentView.h"

#import <React/RCTConversions.h>
#import <React/RCTFabricComponentsPlugins.h>

#import <react/renderer/components/repro_lib/ComponentDescriptors.h>
#import <react/renderer/components/repro_lib/EventEmitters.h>
#import <react/renderer/components/repro_lib/Props.h>
#import <react/renderer/components/repro_lib/RCTComponentViewHelpers.h>

using namespace facebook::react;

@interface ReproViewComponentView ()
@end

@implementation ReproViewComponentView {
    bool _autoSize;
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
      static const auto defaultProps = std::make_shared<const ReproViewProps>();
      _props = defaultProps;
      _autoSize = NO;
  }

  return self;
}

#pragma mark - RCTComponentViewProtocol

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<ReproViewComponentDescriptor>();
}

- (void)updateProps:(const Props::Shared &)props oldProps:(const Props::Shared &)oldProps
{
    const auto &newProps = *std::static_pointer_cast<const ReproViewProps>(props);
    _autoSize = newProps.autoSize;
    
    for (UIView *view in self.subviews) {
        if (_autoSize) {
            view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        } else {
            view.autoresizingMask = UIViewAutoresizingNone;
        }
    }
    
  [super updateProps:props oldProps:oldProps];
}

- (void)didAddSubview:(UIView *)subview
{
    if (_autoSize) {
        subview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
}

@end

Class<RCTComponentViewProtocol> ReproViewCls(void)
{
  return ReproViewComponentView.class;
}
