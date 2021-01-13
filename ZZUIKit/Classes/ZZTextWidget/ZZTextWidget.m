//  Created by MAX on 2018/11/2.
//  FBSnapshotTestCase
//
//  Created by Max on 2021/1/13.
//

#import "ZZTextWidget.h"

@implementation ZZTextWidget

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addObserver];
        [self setView];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self addObserver];
        [self setView];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self addObserver];
        [self setView];
    }
    return self;
}

- (void)setView
{
    if (!self.placeholderLabel) {
        self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, self.frame.size.width, self.frame.size.height)];
        self.placeholderLabel.numberOfLines = 0;
        self.placeholderLabel.font = [self font];
        [self addSubview:self.placeholderLabel];
    }

    if (!self.wordNumLabel) {

        self.wordNumLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.wordNumLabel.font = [UIFont systemFontOfSize:12];
        self.wordNumLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.wordNumLabel];
    }
}

- (void)layoutSubviews
{
    self.placeholderLabel.frame = CGRectMake(8, 6.5, self.frame.size.width - 8, self.frame.size.height);
    [self.placeholderLabel sizeToFit];
    [self.wordNumLabel sizeToFit];
    [self refreshFram];
}

- (void)addObserver
{

    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(placeholderTextViewdidChange:) name:UITextViewTextDidChangeNotification object:self];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    self.placeholderLabel.text = _placeholder;
    [self.placeholderLabel sizeToFit];
    [self endEditing:NO];
}
- (void)setMaxLength:(NSInteger)maxLength
{

    _maxLength = maxLength;
    self.wordNumLabel.text = [NSString stringWithFormat:@"0/%ld字", (long)_maxLength];
}
- (void)placeholderTextViewdidChange:(NSNotification *)notificat
{

    ZZTextWidget *textView = (ZZTextWidget *)notificat.object;
    if ([self.text length] > 0) {
        [self.placeholderLabel setHidden:YES];
    }
    else {
        [self.placeholderLabel setHidden:NO];
    }

    if ([textView.text length] > self.maxLength && self.maxLength != 0 && textView.markedTextRange == nil) {

        textView.text = [textView.text substringToIndex:self.maxLength];
    }
    long length = [textView.text length] > _maxLength ? _maxLength : [textView.text length];
    self.wordNumLabel.text = [NSString stringWithFormat:@"%ld/%ld字", length, (long)_maxLength];
    if (self.didChangeText) {
        self.didChangeText(textView);
    }

    [self refreshFram];
}

- (void)didChangeText:(void (^)(ZZTextWidget *))block
{
    self.didChangeText = block;
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    if (text.length > 0) {
        [self.placeholderLabel setHidden:YES];
        self.wordNumLabel.text = [NSString stringWithFormat:@"%ld/%ld字", (long)[text length], (long)_maxLength];
        [self refreshFram];
    }
}

- (void)refreshFram
{
    [self.wordNumLabel sizeToFit];
    if (self.contentSize.height > self.frame.size.height - self.wordNumLabel.frame.size.height - 5) {
        self.contentInset = UIEdgeInsetsMake(0, 0, self.wordNumLabel.frame.size.height, 0);
        self.wordNumLabel.frame = CGRectMake(self.frame.size.width - self.wordNumLabel.frame.size.width - 15, self.contentSize.height + self.contentInset.bottom - self.wordNumLabel.frame.size.height - 11.5, self.wordNumLabel.frame.size.width, self.wordNumLabel.frame.size.height);
    }
    else {
        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.wordNumLabel.frame = CGRectMake(self.frame.size.width - self.wordNumLabel.frame.size.width - 15, self.frame.size.height + self.contentInset.bottom - self.wordNumLabel.frame.size.height - 11.5, self.wordNumLabel.frame.size.width, self.wordNumLabel.frame.size.height);
        
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
