
def CreateDataLoader(opt):
    from data.custom_dataset_data_loader import CustomDatasetDataLoader
    data_loader = CustomDatasetDataLoader()
    print('dataloader 이름')
    print(data_loader.name())
    print('dataloader 이름')
    data_loader.initialize(opt)
    return data_loader
