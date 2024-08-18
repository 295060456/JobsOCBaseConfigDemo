#  ImageNumberView

    // Data -> View
    UIViewModel *viewModel = UIViewModel.new;
    viewModel.text = @"123.99";
    self.dataMutArr = [self translateToArr:viewModel.text.floatValue
                         saveBitAfterPoint:2];
    self.imageNumberView.jobsRichElementsInViewWithModel(self.dataMutArr);
