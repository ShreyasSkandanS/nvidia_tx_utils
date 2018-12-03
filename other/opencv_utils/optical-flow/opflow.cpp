#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/features2d/features2d.hpp>
#include <opencv2/video/video.hpp>

int main()
{
    cv::VideoCapture input("cars.mp4");
    cv::Mat image;
    cv::OrbFeatureDetector detector;
    cv::vector<cv::KeyPoint> keypoints;

    for(;;)
    {
        if(!input.read(image))
            break;
        detector(image,cv::Mat(),keypoints);
        for(size_t i=0; i<keypoints.size();i++)
        {
            cv::circle(image,keypoints[i].pt,2,cv::Scalar(0,0,255),1);
        }
        cv::imshow("Image",image);
        char c = cv::waitKey();
        if (c == 27)
	    break;
    }
}
