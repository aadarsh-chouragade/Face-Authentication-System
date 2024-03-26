count = 0;
t = 0;
g=0;
x = imread('D:\Download 2.0\Face Authentication\Target\Akshay Kumar_1.jpg');
matchedFolderPath = 'D:\Download 2.0\Face Authentication\Matched\';
a = rgb2gray(x); % Convert to grayscale
a = imresize(a, [100, 100]); % Resize to a fixed size
srcFiles = dir('D:\Download 2.0\Face Authentication\Faces\*.jpg'); % the folder in which your images exist
for i = 1 : length(srcFiles)
    filename = fullfile('D:\Download 2.0\Face Authentication\Faces\', srcFiles(i).name);
    k = imread(filename);
    b = rgb2gray(k); % Convert to grayscale
    b = imresize(b, [100, 100]); % Resize to a fixed size
    count = count + 1;
    c = corr2(a, b);
    if c >= 0.9 % Adjust correlation threshold based on your requirements
        imwrite(k, fullfile(matchedFolderPath, ['matched_' num2str(t) '.jpg'])); % Save matched images
        t = t + 1;
        %disp(['Image ', srcFiles(i).name, ' is similar.']);
    else
        g=g+1;
    end
end
disp(t);
